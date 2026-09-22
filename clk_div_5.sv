// Code your design here
module clk_div_5 (
    input  logic rst_n,
    input  logic clk,
    output logic clk_out
);
logic [2:0] count;
logic neg_buf;

always_ff @(posedge clk, negedge rst_n) begin
    if (!rst_n) begin
        count <= 0;
    end
    else begin
        if (count >= 4)
            count <= 0;
        else
            count <= count + 1;
    end
end

always_ff @(negedge clk, negedge rst_n) begin
    if (!rst_n) begin
        neg_buf <= 0;
    end
    else begin
        neg_buf <= count[1];
    end
end

assign clk_out = count[1] || neg_buf;
// Either one works
// assign clk_out = count[2] || neg_buf;

endmodule