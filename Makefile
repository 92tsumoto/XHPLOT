CFLAGS = -parallel -par-report2 -axsse4.2
TEXT = xhplot

ifeq ($(HOST),hodgkin)
	JVI = nvi
else
	JVI = vim
endif

all: $(TEXT)

$(TEXT):
	icc -O2 $(CFLAGS) -UVERBOSE -DBSD -c xhplot.c

install: xhplot.o
	ar r libxddp.a xhplot.o
	ranlib libxddp.a
	mv libxddp.a /home/tsumoto/lib

v: 
	$(JVI) xhplot.c

me:
	$(JVI) Makefile
