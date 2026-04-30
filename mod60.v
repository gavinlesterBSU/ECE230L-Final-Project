    module mod60(
    input clk, rst, en,
    output [5:0] m, Co
    );

    //implements all necessary internal wires
   wire dr;
   wire s1;
   wire s2;
   wire s3;
   wire s4;
   wire s5;
   wire s6;
   wire w1;
   wire w2;
   wire w3;
   wire w4;
   wire w5;
   wire w6;
   wire b1;
   wire b2;
   wire b3;
   wire b4;
   wire b5;
   wire b6;

    //Reset logic for resetting when the output is 59 or when the reset input is active
    assign dr = (~m[0] & ~m[1] & m[2] & m[3] & m[4] & m[5]) | (rst);

    assign s1 = dr ? 1'b0 : b1;
    assign s2 = dr ? 1'b0 : b2;
    assign s3 = dr ? 1'b0 : b3;
    assign s4 = dr ? 1'b0 : b4;
    assign s5 = dr ? 1'b0 : b5;
    assign s6 = dr ? 1'b0 : b6;

    //calls 6 D flip flops for current state storage
    dff dff1(
        .D(s1),
        .clk(clk),
        .rst(dr),
        .Q(m[0])
     );

    dff dff2(
        .D(s2),
        .clk(clk),
        .rst(dr),
        .Q(m[1])
     );
 
     dff dff3(
        .D(s3),
        .clk(clk),
        .rst(dr),
        .Q(m[2])
     );

     dff dff4(
        .D(s4),
        .clk(clk),
        .rst(dr),
        .Q(m[3])
     );   

     dff dff5(
        .D(s5),
        .clk(clk),
        .rst(dr),
        .Q(m[4])
     );   

     dff dff6(
        .D(s6),
        .clk(clk),
        .rst(dr),
        .Q(m[5])
     );   

     tff tffOut(
        .D(dr),
        .clk(clk),
        .Q(Co)
     );    
     
     //calls full adders to account for binary incrimenting
    full_adder add1(
        .A(m[0]),
        .B(en),
        .Cin(0),
        .Y(b1),
        .Cout(w1)
    );
    
    full_adder add2(
        .A(m[1]),
        .B(0),
        .Cin(w1),
        .Y(b2),
        .Cout(w2)
    );
    
    full_adder add3(
        .A(m[2]),
        .B(0),
        .Cin(w2),
        .Y(b3),
        .Cout(w3)
    );

    full_adder add4(
        .A(m[3]),
        .B(0),
        .Cin(w3),
        .Y(b4),
        .Cout(w4)
    );

    full_adder add5(
        .A(m[4]),
        .B(0),
        .Cin(w4),
        .Y(b5),
        .Cout(w5)
    );
 
    full_adder add6(
        .A(m[5]),
        .B(0),
        .Cin(w5),
        .Y(b6),
        .Cout(w6)
    );

endmodule
