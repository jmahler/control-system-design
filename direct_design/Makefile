
all: dd1s2_plot.pdf

dd1s2_plot.eps: dd1s2_plot.m
	octave $<

dd1s2_plot.pdf: dd1s2_plot.eps
	ps2pdf $<
