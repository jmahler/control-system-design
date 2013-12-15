
all: cl_ex82.pdf cl_ss512.pdf

%.eps: %.m
	octave --silent $<

%.pdf: %.eps
	epspdf $<

clean:
	-rm -f *.eps *.pdf

