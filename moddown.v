module moddown(
    input clk,
    input rst,
    input en,
    input load,
    input [5:0] load_value,
    output reg [5:0] m,
    output reg Co
);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        m <= 6'd0;
        Co <= 0;
    end else if (load) begin
        m <= load_value;
        Co <= 0;
    end else if (en) begin
        if (m == 6'd0) begin
            m <= 6'd0;
            Co <= 1;
        end else begin
            m <= m - 1;
            Co <= 0;
        end
    end
end

endmodule