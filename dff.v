module dff(
    input D, clk, rst,
    output reg Q,
    output NotQ
);

    initial begin
            Q <= 0;
            
    end

    always @(posedge clk) begin 
        if (rst)
            Q <= 1'b0;
        else
             Q <= D; 
            
        
    end

    assign NotQ = ~Q;
    
    


endmodule