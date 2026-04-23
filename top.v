module top 
(
    input clk,           // 100 MHz
    input btnC,          // reset
    input [15:0] sw,     // switches
    output [15:0] led,    //LEDs
    output [3:0] an,     //Outputs for 7-segment display
    output [6:0] seg     //Outputs for 7-segment display
);

/******** DO NOT MODIFY ********/
wire clk_1Hz;       //Generate Internal 1Hz Clock
wire btnC_1Hz;     //Stretch load signal

//If running simulation, output clock frequency is 100MHz, else 1Hz
`ifndef SYNTHESIS
    assign clk_1Hz = clk;
`else
    clk_div #(.INPUT_FREQ(100_000_000), .OUTPUT_FREQ(1)) clk_div_1Hz 
    (.iclk(clk) , .rst(btnC) , .oclk(clk_1Hz));
`endif

// Check stopwatch/timer frequency
initial begin
`ifndef SYNTHESIS
    $display("Stopwatch/Timer Frequency set to 100MHz");
`else
    $display("Stopwatch/Timer Frequency set to 1Hz");
`endif
end

wire [5:0] decide;
wire [5:0] count = decide;

//Seven Segment Display Interface
seven_segment_inf seven_segment_inf_inst (.clk(clk), .rst(btnC), .count(count) , .anode(an), .segs(seg));
/********************************/

/******** UNCOMMENT & UPDATE THIS SECTION ********/
//wire "count" feeds in count value to seven segment display. This should be a 6-bit value
//This will decide if seven segment display shows stopwatch count or timer count



/******** UPDATE THIS SECTION ********/
/******* INITIALIZE STOPWATCH AND TIMER MODULE ***********/
// Control signals
wire mode   = sw[0];        // 0 = stopwatch, 1= timer
wire run    = sw[1];        // 0 = pause (circuit holds it state), 1 = run (counter increments/decrements)
wire load   = sw[2];        // 1 = load value from load_value into timer counter, 0 = do nothing
wire [5:0] load_value = sw[15:10];      //Set Timer Value (Value to load in timer)

//Stopwatch Module Instance
//Use "clk_1Hz" as clock signal to stopwatch and timer modules

//Assign stopwatch and timer states to wires.

wire [5:0] stopWatchState;
wire [5:0] timerState;

//assign seven segment display wire based on mode

assign decide = mode ? timerState : stopWatchState;

//assign state wires to leds.

assign led[8:3] = stopWatchState;
assign led[15:10] = timerState;

    stopwatch stopwatch1(
    
    .clk(clk_1Hz),
    .rst(btnC),
    .en(sw[1]),
    .state(stopWatchState)
    
    );

//Timer Module Instance
//Use "clk_1Hz" as clock signal to stopwatch and timer modules

    timer timer1(
        
        .clk(clk_1Hz),
        .rst(btnC),
        .en(sw[1]),
        .load_value(sw[15:10]),
        .load(sw[2]),
        .state(timerState)
    
    );

endmodule