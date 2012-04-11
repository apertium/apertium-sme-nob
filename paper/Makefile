all: sme-nob.pdf

cslipubscollection.tar.gz:
	wget "http://cslipublications.stanford.edu/ftp-pub/publications/latex-package/latex2e-native/cslipubscollection.tar.gz" -O $@

cslipubscollection/example.tex: cslipubscollection

cslipubscollection: cslipubscollection.tar.gz
	tar xzvf $<
	mv cslipubscollection/example-ch01/ch01.tex cslipubscollection/example-ch01/ch01.tex.old
	mv cslipubscollection/example-ch01/ch01.bib cslipubscollection/example-ch01/ch01.bib.old

cslipubscollection/example-ch01/ch01.tex: sme-nob.tex cslipubscollection
	cp $< $@

cslipubscollection/example-ch01/ch01.bib: apertium.bib cslipubscollection
	cp $< $@


sme-nob.pdf: cslipubscollection/example.dvi
	cd cslipubscollection && pdflatex example && cp example.pdf ../sme-nob.pdf

cslipubscollection/example.dvi:  cslipubscollection/example.tex cslipubscollection/example-ch00.tex cslipubscollection/example-ch01.tex cslipubscollection/example-ch02.tex cslipubscollection/example-ch01/ch01.tex cslipubscollection/example-ch01/ch01.bib cslipubscollection/example-ch02/ch02.tex cslipubscollection/example-ch02/ch02.bib cslipubscollection/example-index.tex
	cd cslipubscollection && latex -halt-on-error     example
	cd cslipubscollection && bibtex    example-ch01
	cd cslipubscollection && bibtex    example-ch02
	cd cslipubscollection && makeindex example
	cd cslipubscollection && latex -halt-on-error     example
	cd cslipubscollection && latex -halt-on-error     example
	cd cslipubscollection && makeindex example
	cd cslipubscollection && latex -halt-on-error     example

clean:
	cd cslipubscollection && rm -f *.ilg *.dvi *~ *.blg *.log

veryclean:
	rm -rf cslipubscollection



getbib:
	wget "http://bibsonomy.org/bib/user/unhammer/apertium?bibtex.entriesPerPage=100" -O apertium.bib
	touch apertium.bib

PHONY : ps all clean veryclean getbib
