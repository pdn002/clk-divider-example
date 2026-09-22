`timescale 1ns / 1ps
module clk_div_n_tb;

logic rst_n;
logic clk;
logic clk_3;
logic clk_4;
logic clk_5;

clk_div_n #(.DIV_CLK(3)) div3 (
    .rst_n(rst_n),
    .clk(clk),
    .clk_out(clk_3)    
);
clk_div_n #(.DIV_CLK(4)) div4 (
    .rst_n(rst_n),
    .clk(clk),
    .clk_out(clk_4)    
);
clk_div_n #(.DIV_CLK(5)) div5 (
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
    $dumpvars(0, clk_div_n_tb);
    
    rst_n = 0;
    #20;
    rst_n = 1;

    for (integer i = 0; i < 25; i++) begin
        #5;
    end

    $finish;
end

endmodule