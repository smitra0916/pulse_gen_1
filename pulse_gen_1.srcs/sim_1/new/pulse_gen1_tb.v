`timescale 1ns / 1ps

module tpulse_gen1_tb;
reg clk =0;
wire led;
pulse_gen1 uut(clk, led) ;

always #5 clk = ~clk;
endmodule