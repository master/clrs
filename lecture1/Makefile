doc=lecture1

all: view

pdf: $(doc).tex
	latex $(doc).tex
	dvips $(doc).dvi
	ps2pdf $(doc).ps

view: pdf
	evince $(doc).pdf

clean:
	rm -f $(doc).dvi $(doc).aux $(doc).ps $(doc).pdf $(doc).nav \
	$(doc).out $(doc).snm $(doc).toc $(doc).log $(doc).vrb
