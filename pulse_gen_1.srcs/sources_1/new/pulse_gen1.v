`timescale 1ns / 1ps

module pulse_gen1 (
    input clk,
    output led
    );
    
// create a simple counter
reg [7: 0] counter =0;
    
always@ (posedge clk) begin
    if (counter < 100) counter <= counter +1;   // count until 100
    else counter <= 0; // reset counter
end
// create 20S duty cycle
assign led = (counter <20) ? 1:0; // assign Zed to 1 if counter value is less
endmodule
