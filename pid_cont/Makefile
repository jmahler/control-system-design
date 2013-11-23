
all: pids2s4_plot.pdf

pids2s4_plot.eps: pids2s4_plot.m
	octave $<

pids2s4_plot.pdf: pids2s4_plot.eps
	epspdf $<

clean:
	-rm -f *.eps *.pdf
