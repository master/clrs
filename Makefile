TEXFILE	= syllabus.tex lecture1.tex lecture2.tex lecture3.tex \
	lecture4.tex lecture5.tex lecture6.tex lecture7.tex \
	lecture8.tex lecture9.tex lecture10.tex lecture11.tex

.PHONY: dvi ps pdf clean

pdf:	$(TEXFILE:.tex=.pdf)
ps:	$(TEXFILE:.tex=.ps)
dvi:	$(TEXFILE:.tex=.dvi)

%.dvi: %.tex
	( \
	latex $<; \
	while grep -q "Rerun to get cross-references right." $(<:.tex=.log); \
	do \
		latex $<; \
	done \
	)

%.ps: %.dvi
	dvips -q $< -o $(<:.dvi=.ps)

%.pdf: %.ps
	ps2pdf $<

clean:
	@rm -f \
	$(TEXFILE:.tex=.aux) \
	$(TEXFILE:.tex=.log) \
	$(TEXFILE:.tex=.out) \
	$(TEXFILE:.tex=.dvi) \
	$(TEXFILE:.tex=.pdf) \
	$(TEXFILE:.tex=.toc) \
	$(TEXFILE:.tex=.ps)
