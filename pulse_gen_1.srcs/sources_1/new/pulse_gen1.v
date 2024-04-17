`timescale 1ns / 1ps

module pulse_gen1 (
    input clk,
    input reset,
    
    output valve_1,
    output valve_2,
    output discharge_1,
    output ms_shield_1,
    output ms_shield_2,
    output ms_repeller_1,
    output ms_repeller_2,
    output ms_extractor_1,
    output ms_extractor_2,
    output ms_lens_1,
    output ms_lens_2,
    output vmi_ion_repeller_1,
    output vmi_ion_repeller_2,
    output vmi_ion_extractor_1,
    output vmi_ion_extractor_2,
    output vmi_ion_lens_1,
    output vmi_ion_lens_2,
    output mcp_ion,
    output camera_ion,
    output mass_gating
    );
    
// create a simple counter
reg [32: 0] counter =0;
reg [1:0] res=0;

 // Timing parameters
 parameter CYCLE_TIME = 1e8; // 100 ms (can be adjusted)
 parameter PULSE_WIDTH = 250;  // 250 ns (can be adjusted)
 parameter DELAY1 = 10000;    // 10 us (can be adjusted)
 parameter DELAY2 = 5000;    // 5 us (can be adjusted)
 parameter MASS_GATING_WIDTH = 5; // 5 ns (can be adjusted)

   
always@ (posedge clk or negedge reset) begin
    if(!reset) begin
        counter<=0;
        res<=1;
     end else if(res==1) begin
         if (counter < CYCLE_TIME) counter <= counter +1;   // count until 100
        else counter <= 0; // reset counter
    end
end
//PULSES
assign valve_1 = (counter > 0 && counter <= PULSE_WIDTH ) ? 1:0;

assign valve_2 = (counter > DELAY1 && counter <= DELAY1 + PULSE_WIDTH ) ? 1:0; 

assign discharge_1 = (counter > DELAY1 && counter <= DELAY1 + PULSE_WIDTH ) ? 1:0; 

assign ms_shield_1 = (counter > DELAY1 + DELAY2 && counter <= DELAY1 + DELAY2 + PULSE_WIDTH) ? 1:0; 

assign ms_shield_2 = (counter > DELAY1 + DELAY2 && counter <= DELAY1 + DELAY2 + PULSE_WIDTH) ? 0:1; 

assign ms_repeller_1 = (counter > DELAY1 + DELAY2 && counter <= DELAY1 + DELAY2 + PULSE_WIDTH) ? 1:0; 

assign ms_repeller_2 = (counter > DELAY1 + DELAY2 && counter <= DELAY1 + DELAY2 + PULSE_WIDTH) ? 0:1; 

assign ms_extractor_1 = (counter > DELAY1 + DELAY2 && counter <= DELAY1 + DELAY2 + PULSE_WIDTH) ? 1:0; 

assign ms_extractor_2 = (counter > DELAY1 + DELAY2 && counter <= DELAY1 + DELAY2 + PULSE_WIDTH) ? 0:1; 

assign ms_lens_1 = (counter > DELAY1 + DELAY2 && counter <= DELAY1 + DELAY2 + PULSE_WIDTH) ? 1:0; 

assign ms_lens_2 = (counter > DELAY1 + DELAY2 && counter <= DELAY1 + DELAY2 + PULSE_WIDTH) ? 0:1; 

assign vmi_ion_repeller_1 = (counter > DELAY1 + DELAY2 && counter <= DELAY1 + DELAY2 + PULSE_WIDTH) ? 1:0; 

assign vmi_ion_repeller_2 = (counter > DELAY1 + DELAY2 && counter <= DELAY1 + DELAY2 + PULSE_WIDTH) ? 0:1; 

assign vmi_ion_extractor_1 = (counter > DELAY1 + DELAY2 && counter <= DELAY1 + DELAY2 + PULSE_WIDTH) ? 1:0; 

assign vmi_ion_extractor_2 = (counter > DELAY1 + DELAY2 && counter <= DELAY1 + DELAY2 + PULSE_WIDTH) ? 0:1; 

assign vmi_ion_lens_1 = (counter > DELAY1 + DELAY2 && counter <= DELAY1 + DELAY2 + PULSE_WIDTH) ? 1:0; 

assign vmi_ion_lens_2 = (counter > DELAY1 + DELAY2 && counter <= DELAY1 + DELAY2 + PULSE_WIDTH) ? 0:1; 

assign mcp_ion = (counter > DELAY1 + DELAY2 && counter <= DELAY1 + DELAY2 + PULSE_WIDTH) ? 1:0; 

assign camera_ion = (counter > DELAY1 + DELAY2 && counter <= DELAY1 + DELAY2 + PULSE_WIDTH) ? 1:0; 

assign mass_gating = (counter > DELAY1 + DELAY2 && counter <= DELAY1 + DELAY2 + MASS_GATING_WIDTH) ? 1:0; 




endmodule
