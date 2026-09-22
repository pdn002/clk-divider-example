// Code your design here
module clk_div_n #(
    parameter integer DIV_CLK = 3
) (
    input  logic rst_n,
    input  logic clk,
    output logic clk_out
);
logic [$clog2(DIV_CLK):0] count;
logic [$clog2(DIV_CLK):0] alt_count;

always_ff @(posedge clk, negedge rst_n) begin
    if (!rst_n) begin
        count <= 0;
    end
    else begin
        if (count >= DIV_CLK - 1)
            count <= 0;
        else
            count <= count + 1;
    end
end

always_ff @(negedge clk, negedge rst_n) begin
    if (!rst_n) begin
        alt_count <= 0;
    end
    else begin
        alt_count <= count;
    end
end

// Need to check if diving clk by even or odd amount

assign clk_out = (DIV_CLK[0]) ? (count < DIV_CLK / 2) || (alt_count < DIV_CLK / 2) :
                                (count < DIV_CLK / 2);

endmodule