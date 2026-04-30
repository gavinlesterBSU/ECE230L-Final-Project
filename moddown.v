module moddown(
    input clk,
    input rst,
    input en,
    input load,
    input [5:0] load_value,
    output reg [5:0] m,
    output reg Co
);

    //initializes positive clock edge test
always @(posedge clk or posedge rst) begin
    if (rst) begin //assigns state to 0 if reset is active
        m <= 6'd0;
        Co <= 0;
    end else if (load) begin //assigns state to load value if load is active
        m <= load_value;
        Co <= 0;
    end else if (en) begin //increments state down while enable is active, stopping at output = 0
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
