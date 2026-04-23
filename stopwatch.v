//StopWatch: Modulo-60 Counter
module stopwatch(
    input clk,
    input rst,
    input en,
    output [5:0] state     //6-bits to represent the highest number 59
);


    mod60 stop(
    
    .clk(clk),
    .rst(rst),
    .en(en),
    .m(state)

);







endmodule




