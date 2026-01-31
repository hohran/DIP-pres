NAME=main

.PHONY: all

all: $(NAME).pdf 

$(NAME).pdf: clean
	pdflatex $(NAME).tex

.PHONY: clean

clean:
	rm -rf $(NAME).pdf
