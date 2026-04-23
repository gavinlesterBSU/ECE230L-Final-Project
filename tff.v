module tff(
    input D, clk,
    output Q,
    output NotQ
);

jkff part1(
    .J(D),
    .K(D),
    .clk(clk),
    .Q(Q),
    .NotQ(NotQ)
    );

  /*  always @(posedge clk) begin 
            
            if (D)
             Q <= ~Q; 
             
        
    end

    assign NotQ = ~Q;
*/
endmodule