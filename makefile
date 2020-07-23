BUILD = build
BOOKNAME = letters
CHAPTERS = intro.tex l1.tex l2.tex l3.tex l4.tex l5.tex l6.tex l7.tex l8.tex l9.tex l10.tex l11.tex l12.tex l13.tex l14.tex l15.tex l16.tex l17.tex l18.tex
TOC = --toc --toc-depth=2
COVER_IMAGE = images/cover.jpg
LATEX_CLASS = report

all: book

book: pdf

clean:
	rm $(BOOKNAME).pdf

pdf: $(BOOKNAME).pdf

$(BOOKNAME).pdf: $(CHAPTERS) t.latex
	pandoc --toc --template t.latex --pdf-engine=xelatex -V documentclass=report -o $@ $(CHAPTERS)

see: $(BOOKNAME).pdf
	zathura $^ &

.PHONY: all clean pdf see