#!/bin/bash
iverilog -g2012 clk_div_5_tb.sv clk_div_5.sv
vvp a.out
gtkwave wave.vcd