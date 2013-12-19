
all: cl_fonp01.pdf cl_fonp02.pdf cl_fonp05.pdf \
	cl_fope01.pdf cl_fope05.pdf

%.eps: %.m
	octave --silent $<

%.pdf: %.eps
	epspdf $<

clean:
	-rm -f *.eps *.pdf

