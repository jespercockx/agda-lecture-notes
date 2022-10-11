.PHONY : clean realclean
.PRECIOUS : %.tex

default: agda.pdf

%.pdf : latex/%.tex agda.sty
	latexmk --pdf -pdflatex="pdflatex -interaction=nonstopmode" -use-make $<

latex/%.tex : %.lagda.tex
	agda-2.6.2 --latex $<

clean:
	rm -f *.aux *.log *.out *.ptb *.blg *.fdb_latexmk *.agdai *.fls *.toc *~

realclean: clean
	rm -f *.glob *.vo *.bbl latex/* agda.pdf


