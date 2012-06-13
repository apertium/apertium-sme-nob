TARGET=smenob_talk

# make pdf by default
all: ${TARGET}.pdf

# it doesn't really need the .dvi, but this way all the refs are right
%.pdf : ${TARGET}.tex
	@pdflatex $*
# no bibliography, so using tex instead of dvi here:
#%.dvi

${TARGET}.bbl: ../apertium.bib
# in case we don't already have a .aux file listing citations
# this should probably be a separate makefile target/dependency instead
# of doing it every time... but *shrug*
	@latex -halt-on-error ${TARGET}.tex
# get the citations out of the bibliography
	@bibtex ${TARGET}
# do it again in case there are out-of-order cross-references
	@latex -halt-on-error ${TARGET}.tex

${TARGET}.dvi: ${TARGET}.bbl ${TARGET}.tex
	@latex -halt-on-error ${TARGET}.tex

# shortcut, so we can say "make ps"
ps: ${TARGET}.ps

${TARGET}.ps: ${TARGET}.dvi
	@dvips -t a4 ${TARGET}.dvi

clean:
	rm -f ${TARGET}.{log,aux,ps,dvi,bbl,blg,log,snm,toc,vrb,out,nav}

reallyclean: clean
	rm -f ${TARGET}.{ps,pdf}


PHONY : ps all clean reallyclean getbib
