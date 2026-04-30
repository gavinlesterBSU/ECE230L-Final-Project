module full_adder(
    input A,
    input B,
    input Cin,
    output Y,
    output Cout
);

    //combinatorial logic assignment for output Y
    assign Y = (~A & ~B & Cin) |
                (~A & B & ~Cin) |
                (A & B & Cin) |
                (A & ~B & ~Cin);

    //combinatorial logic assignment for carry out
    assign Cout = (A & B) |
                    (B & Cin) |
                    (A & Cin);




endmodule
