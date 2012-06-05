TARGET=sme-nob
all: $(TARGET).tgz


CSLIDEPS=cslipubs.sty cslipubs-extra.sty cslipubs-natbib.bst
cslipubscollection.tar.gz:
	wget "http://cslipublications.stanford.edu/ftp-pub/publications/latex-package/latex2e-native/cslipubscollection.tar.gz" -O $@
cslipubscollection: cslipubscollection.tar.gz
	tar xzvf $<
	touch cslipubscollection
cslipubs.sty: cslipubscollection
	cp cslipubscollection/$@ $@
cslipubs-extra.sty: cslipubscollection
	cp cslipubscollection/$@ $@
cslipubs-natbib.bst: cslipubscollection
	cp cslipubscollection/$@ $@


architecture.pdf: architecture.obj
	tgif -print -eps $<
	epstopdf architecture.eps


$(TARGET).pdf: $(TARGET).tex apertium.bib architecture.pdf $(CSLIDEPS)
	latex -halt-on-error $(TARGET)
	bibtex               $(TARGET)
	makeindex            $(TARGET)
	latex -halt-on-error $(TARGET)
	latex -halt-on-error $(TARGET)
	makeindex            $(TARGET)
	latex -halt-on-error $(TARGET)
	pdflatex             $(TARGET)

clean:
	rm -f $(TARGET).{ilg,dvi.blg,log,aux,bbl,idx,ind}

veryclean: clean
	rm -rf cslipubscollection $(TARGET).pdf architecture.pdf $(CSLIDEPS)


$(TARGET).tgz: $(TARGET).pdf $(TARGET).tex apertium.bib  architecture.obj architecture.eps architecture.pdf Makefile
	tar czvf $@ --numeric-owner -C .. paper/$(TARGET).pdf paper/$(TARGET).tex paper/apertium.bib paper/architecture.obj paper/architecture.eps paper/architecture.pdf paper/Makefile 
# -C .. is such a hack, can't tar add a fake root dir to avoid tarbombing? 


getbib:
	wget "http://bibsonomy.org/bib/user/unhammer/apertium?bibtex.entriesPerPage=100" -O apertium.bib
	touch apertium.bib

PHONY : ps all clean veryclean getbib
