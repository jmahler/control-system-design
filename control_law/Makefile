
all: cl_ex83.pdf cl_ss512.pdf cl_ex81.pdf cl_ex85.pdf

%.eps: %.m
	octave --silent $<

%.pdf: %.eps
	epspdf $<

clean:
	-rm -f *.eps *.pdf

