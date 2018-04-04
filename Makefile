#HTMLDIR=/home/zeus/httpd/html/texts
HTMLDIR=~/mnt/zeus/httpd/html/texts
HTMLDIR_LAB=/home/zeus/httpd/html/lab/texts
CP=cp -v

.SUFFIXES: .tex .ps .html .pdf

all: math-lesson math-lesson2 math-lesson3 math-lesson4 math-lesson5
math-lesson: math-lesson.dvi math-lesson.pdf math-lesson.ind
math-lesson2: math-lesson2.dvi math-lesson2.pdf math-lesson2.ind
math-lesson3: math-lesson3.dvi math-lesson3.pdf math-lesson3.ind
math-lesson4: math-lesson4.dvi math-lesson4.pdf math-lesson4.ind
math-lesson5: math-lesson5.dvi math-lesson5.pdf math-lesson5.ind

index: 
	mendex -r -c -g -s dot.ist math-lesson
	mendex -r -c -g -s dot.ist math-lesson2
	mendex -r -c -g -s dot.ist math-lesson3
	mendex -r -c -g -s dot.ist math-lesson4
	mendex -r -c -g -s dot.ist math-lesson5

clean:
	rm -f *.aux *.log *.bbl *.blg *.toc *.dvi *.ilg *.ind *.idx *~ 

install-math: math-lesson math-lesson2 math-lesson3 math-lesson4 math-lesson5
	chmod 664 $<.{pdf,dvi}
	${CP} $<.pdf ${HTMLDIR}

.tex.idx:
	platex $<

.tex.dvi:
	platex $<
	mendex -r -c -g -s dot.ist $*
	platex $<
	platex $<

.dvi.pdf: 
	dvipdfmx $<
