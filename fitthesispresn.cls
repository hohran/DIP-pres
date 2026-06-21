\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fitthesispresn}[2020/09/14]

%Vychozi hodnoty parametru / Default values for parameters
\newif\ifczech \let\ifczech\iftrue
\newif\ifenglish \let\ifenglish\iffalse
\newif\ifwideratio \let\ifwideratio\iffalse

%-----------------------------------------------------------------------------
% Parametry tridy (odkomentovani zakomentovanych na vlastni nebezpeci)
% Class parameters (uncommenting of commented one is only on your own risk)
%-----------------------------------------------------------------------------
\DeclareOption{english}{\let\ifenglish\iftrue\let\ifczech\iffalse}
\DeclareOption{wideratio}{\let\ifwideratio\iftrue}
\DeclareOption*{}
\ProcessOptions\relax
\ifwideratio
  \LoadClass[xcolor=dvipsnames,table,10pt,aspectratio=169]{beamer}
\else
  \LoadClass[xcolor=dvipsnames,table,10pt]{beamer}
\fi

%-----------------------------------------------------------------------------
% Balicky / Packages
%-----------------------------------------------------------------------------
\ifenglish
  \PassOptionsToPackage{main=english}{babel}
\fi
\usepackage[czech,slovak,english]{babel}
\usepackage[utf8]{inputenc} %kodovani / encoding
\usepackage{newcent}
\usepackage{hyperref}
\usepackage{fancyvrb}
\usepackage{appendixnumberbeamer}
\usepackage{tikz}
\usepackage{xspace}
\usepackage{listings}
\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.1,0,0.82}
\definecolor{backcolour}{rgb}{0.95,0.95,0.92}

\lstdefinelanguage{Rego}{
  morekeywords={package,import,default,not,else,if,contains,every,in,true,false,null,some},
  sensitive=true,
  morecomment=[l]{\#},
  morestring=[b]"
}
\lstdefinelanguage{SMT}{
  morekeywords={assert,ite,and,or,declare-datatype,declare,datatypes,datatype,store,as,const,Int,String,Boolean,true,false,Array,Seq,Set,fun,str,len},
  sensitive=true,
  morecomment=[l]{\;},
  morestring=[b]"
}
\lstset{
  basicstyle=\ttfamily\small,
  keywordstyle=\bfseries\color{codepurple},
  commentstyle=\itshape\color{gray},
  stringstyle=\color{codegreen},
  frame=single,
  breaklines=true,
  numbers=left,
  numberstyle=\tiny\color{gray},
  xleftmargin=2em,
  keepspaces=true,                 
}

% Volba loga dle zvoleneho jazyka / Logo selection according to the chosen language
\ifenglish
  \usetheme{FIT}
\else
  \usetheme[logocz]{FIT}
\fi

\ifczech
  \main@language{czech}
\else
  \main@language{english}
\fi

%-----------------------------------------------------------------------------
% Texty / Texts
%-----------------------------------------------------------------------------
\def\@supervisor@CS{Vedoucí: }
\def\@supervisor@EN{Supervisor: }

%-----------------------------------------------------------------------------
% Projectinfo - parametrizace sablony / template parameters
%-----------------------------------------------------------------------------
% Parametry / Parameters
\define@key{projinfo}{title}{\def\@title{#1}}
\define@key{projinfo}{title.footer}{\def\@title@f{#1}}
\define@key{projinfo}{author.name}{\def\@author@n{#1}}
\define@key{projinfo}{author.surname}{\def\@author@s{#1}}
\define@key{projinfo}{author.title.first}{\def\@author@tf{#1}}
\define@key{projinfo}{supervisor.name}{\def\@supervisor@n{#1}}
\define@key{projinfo}{supervisor.surname}{\def\@supervisor@s{#1}}
\define@key{projinfo}{supervisor.title.first}{\def\@supervisor@tf{#1}}
\define@key{projinfo}{supervisor.title.last}{\def\@supervisor@tl{#1}}
\define@key{projinfo}{date}{\def\@date{#1}}

% Vychozi hodnoty / Default values
\setkeys{projinfo}{
  date=\today
}
    
\ifczech
  \setkeys{projinfo}{
      title={Název prezentace}, title.footer={Název prezentace},
      author.name=Jméno, author.surname=Příjmení, author.title.first={},
      supervisor.name=Jméno, supervisor.surname=Příjmení, supervisor.title.first={}, supervisor.title.last={},
    }%
\else
  \setkeys{projinfo}{
    title={Title of a Presentation}, title.footer={Title of a Presentation},
    author.name=Name, author.surname=Surname, author.title.first={},
    supervisor.name=Name, supervisor.surname=Surname, supervisor.title.first={}, supervisor.title.last={},
  }% 
\fi

\def\projectinfo{\setkeys{projinfo}}

% Cele jmeno autora/vedouciho / Full name of author/supervisor
\usepackage{ifthen}
\def\@author{\@author@tf\ \@author@n\ \@author@s}
\def\@supervisor{\@supervisor@tf\ \@supervisor@n\ \@supervisor@s\ifthenelse{\equal{\@supervisor@tl}{}}{}{,~\@supervisor@tl}}


\newcommand{\true}{\textbf{true}\xspace}
\newcommand{\false}{\textbf{false}\xspace}
%-----------------------------------------------------------------------------
% Titulní stránka / Title page
%-----------------------------------------------------------------------------
\title[\@title@f]{\@title}
\author[]{\@author}
\institute[]{\footnotesize{\ifczech\@supervisor@CS\else\@supervisor@EN\fi \@supervisor}}
\date{\@date}
