module jkff(
    input J, K, clk,
    output Q,
    output NotQ
);



    //combinatorial internal logic for JK flip flop
assign w1 = (J&NotQ) | (~K&Q); 


//calls D flip flop    
dff part1(
    .D(w1),
    .clk(clk),
    .rst(),
    .Q(Q),
    .NotQ(NotQ)
    );

    

endmodule
