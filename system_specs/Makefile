
all: spec0525_plot.pdf spec0525s_plot.pdf

%.eps: %.m
	octave $<

%.pdf: %.eps
	epspdf $<

clean:
	-rm -f *.eps *.pdf
