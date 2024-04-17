`timescale 1ns / 1ps

module tpulse_gen1_tb;
reg clk =0;
reg reset=1;

wire valve_1;
wire valve_2;
wire discharge_1;
wire ms_shield_1;
wire ms_shield_2;
wire ms_repeller_1;
wire ms_repeller_2;
wire ms_extractor_1;
wire ms_extractor_2;
wire ms_lens_1;
wire ms_lens_2;
wire vmi_ion_repeller_1;
wire vmi_ion_repeller_2;
wire vmi_ion_extractor_1;
wire vmi_ion_extractor_2;
wire vmi_ion_lens_1;
wire vmi_ion_lens_2;
wire mcp_ion;
wire camera_ion;
wire mass_gating;


pulse_gen1 uut(clk,
    reset,
    valve_1,
    valve_2,
    discharge_1,
    ms_shield_1,
    ms_shield_2,
    ms_repeller_1,
    ms_repeller_2,
    ms_extractor_1,
    ms_extractor_2,
    ms_lens_1,
    ms_lens_2,
    vmi_ion_repeller_1,
    vmi_ion_repeller_2,
    vmi_ion_extractor_1,
    vmi_ion_extractor_2,
    vmi_ion_lens_1,
    vmi_ion_lens_2,
    mcp_ion,
    camera_ion,
    mass_gating) ;

always #0.5 clk = ~clk;

initial begin
   reset = 1'b1;
   #100 reset = 1'b0; // Apply reset pulse
   #100 reset = 1'b1;
end

endmodule