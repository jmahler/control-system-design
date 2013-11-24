
all: pps2s1a_plot.pdf pps2s1ar_plot.pdf pps2s1_plot.pdf \
		pps2s1r_plot.pdf pps2s4_plot.pdf pps2s4r_plot.pdf

%.eps: %.m
	octave $<

%.pdf: %.eps
	epspdf $<

clean:
	-rm -f *.eps *.pdf
