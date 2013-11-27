
all: mm3679_plot.pdf mm3679r_plot.pdf

%.eps: %.m
	octave $<

%.pdf: %.eps
	epspdf $<

clean:
	-rm -f mm3679_plot.eps mm3679_plot.pdf
	-rm -f mm3679r_plot.eps mm3679r_plot.pdf
