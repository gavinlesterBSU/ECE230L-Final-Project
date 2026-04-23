module jkff(
    input J, K, clk,
    output Q,
    output NotQ
);

//    wire w1;
  //  wire s1;

    
    //wire w1 is the input of D, wire S1 is the output of Q
    
assign w1 = (J&NotQ) | (~K&Q); 

//assign Q = s1;
    
dff part1(
    .D(w1),
    .clk(clk),
    .rst(),
    .Q(Q),
    .NotQ(NotQ)
    );

    

endmodule