
all: pids2s4_plot.pdf pids2s4r_plot.pdf

%.eps: %.m
	octave $<

%.pdf: %.eps
	epspdf $<

clean:
	-rm -f *.eps *.pdf
