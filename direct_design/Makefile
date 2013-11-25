
all: dd1s2_plot.pdf dd1s2r_plot.pdf \
	dd1s2s_plot.pdf dd1s2sr_plot.pdf

%.eps: %.m
	octave $<

%.pdf: %.eps
	epspdf $<

clean:
	-rm -f *.eps *.pdf
