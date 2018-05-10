.PHONY: all clean

FIGURES = figures/visibility_visibility_100kev.pgf figures/images_S00052.pgf

all: abstract100.pdf additional_info.pdf poster.pdf manuscript.pdf figures/visibility_visibility_100kev.pgf $(FIGURES)

$(FIGURES):
	make -C figures all

manuscript.pdf: manuscript.tex library.bib $(FIGURES)
	latexmk -bibtex -pdf $<

abstract100.pdf: abstract100.txt
	rst2pdf $<

additional_info.pdf: additional_info.tex
	pdflatex $<
	pdflatex $<

poster.pdf: poster.tex
	-rm poster.aux 
	pdflatex poster
	bibtex poster
	pdflatex poster
	pdflatex poster
	pdftk poster.pdf cat output poster-fixed.pdf
	mv poster-fixed.pdf poster.pdf

clean:
	rm -rf *.aux *.pdf *.ps *.log *.dvi *.bbl *.blg
