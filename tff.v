module tff(
    input D, clk,
    output Q,
    output NotQ
);

    //calls JK flip flop for basic logic
jkff part1(
    .J(D),
    .K(D),
    .clk(clk),
    .Q(Q),
    .NotQ(NotQ)
    );

endmodule
