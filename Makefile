PAPER = template
TEX = $(wildcard *.tex)
BIB = references.bib
FIGS = $(wildcard figures/*.pdf figures/*.png graphs/*.pdf graphs/*.png)

.PHONY: all clean

$(PAPER).pdf: $(TEX) $(BIB) $(FIGS) jpaper.cls
	echo $(FIGS)
	/usr/texbin/pdflatex $(PAPER)
	/usr/texbin/bibtex $(PAPER)
	/usr/texbin/pdflatex $(PAPER)
	/usr/texbin/pdflatex $(PAPER)
	open template.pdf
clean:
	rm -f *.aux *.bbl *.blg *.log *.out $(PAPER).pdf

