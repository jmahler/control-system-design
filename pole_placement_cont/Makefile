
all: pps2s4_plot.pdf

pps2s4_plot.eps: pps2s4_plot.m
	octave $<

pps2s4_plot.pdf: pps2s4_plot.eps
	epspdf $<
