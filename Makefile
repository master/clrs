TEXFILE	= syllabus.tex lecture1.tex lecture2.tex lecture3.tex \
	lecture4.tex lecture5.tex lecture6.tex lecture7.tex \
	lecture8.tex lecture9.tex lecture10.tex lecture11.tex \
	letcrure12.tex lecture13.tex lecture14.tex \
	students.tex 

.PHONY: pdf clean 

.PRECIOUS: %.bbl

pdf:	$(TEXFILE:.tex=.pdf)

define run-latex
	( \
	latex $(<:.aux=.tex); \
	while grep -Eq "(undefined references|get cross-references right)" $(<:.aux=.log); \
	do \
		latex $(<:.aux=.tex); \
	done \
	)
endef

%.dvi: %.tex

%.aux: %.tex
	latex $<
	rm -f $(<:.tex=.dvi)

%.bbl: %.aux %.bib
	bibtex $<

%.dvi: %.aux %.bbl
	@$(run-latex)

%.dvi: %.aux
	@$(run-latex)

%.ps: %.dvi
	dvips -q $< -o $(<:.dvi=.ps)

%.pdf: %.ps
	ps2pdf $<

clean:
	@rm -f *.aux *.log *.out *.dvi *.pdf *.toc *.bbl *.blg *.ps
