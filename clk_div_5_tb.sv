`timescale 1ns / 1ps
module clk_div_5_tb;

logic rst_n;
logic clk;
logic clk_5;

clk_div_5 div5 (
    .rst_n(rst_n),
    .clk(clk),
    .clk_out(clk_5)    
);

initial begin
    clk = 0;
    forever begin
        #5 clk = ~clk;
    end
end

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, clk_div_5_tb);
    
    rst_n = 0;
    #20;
    rst_n = 1;

    for (integer i = 0; i < 25; i++) begin
        #5;
    end

    $finish;
end

endmodule