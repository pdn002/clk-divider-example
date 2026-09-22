.PHONY: all compile run wave clean

all: wave

# -g2012 is for compiling System Verilog
compile:
	iverilog -g2012 -o clk_div.out -f filelist

run: compile
	vvp clk_div.out

wave: run
	gtkwave wave.vcd

clean:
	rm -r *.out *.vcd
