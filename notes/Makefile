
main.pdf: main.tex
	pdflatex main.tex
	biber main
	pdflatex main.tex

clean:
	-rm -f main.pdf
	-rm -f *.out *.xml *.toc *.blg *.bbl *.bcf *.aux main.log texput.log
