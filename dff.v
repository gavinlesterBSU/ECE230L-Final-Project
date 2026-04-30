module dff(
    input D, clk, rst,
    output reg Q,
    output NotQ
);

    initial begin //assigns Q to 0 when the program is initialized
            Q <= 0;
            
    end

    always @(posedge clk) begin //checks if reset is active, otherwise sets output equal to D
        if (rst)
            Q <= 1'b0;
        else
             Q <= D; 
            
        
    end

    assign NotQ = ~Q;
    
    


endmodule
