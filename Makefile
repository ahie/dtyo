# Author: Emiliano Carlos de Moraes Firmino @ 10/2012
# Edited by: Aleksi Hietanen @ 07/2018
SHELL=/bin/sh
PAPER=main

.SUFFIXES:
.SUFFIXES: .bib .pdf .tex
.PHONY: clean

run: $(PAPER).pdf

$(PAPER).pdf: $(PAPER).bbl $(PAPER).tex
	pdflatex $(PAPER).tex -draftmode
	pdflatex $(PAPER).tex 

$(PAPER).bbl: $(PAPER).aux
	bibtex $(PAPER).aux

$(PAPER).aux: $(PAPER).bib
	pdflatex $(PAPER).tex -draftmode
	pdflatex $(PAPER).tex -draftmode

clean:
	find . -regex '.*\.\(aux\|lof\|log\|lot\|toc\|bbl\|blg\)' -exec rm {} \;
