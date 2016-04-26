`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:50:20 04/26/2016
// Design Name:   full_adder4
// Module Name:   C:/Users/pete/Documents/GitHub/fpgabeginner/fullAdder/testbench.v
// Project Name:  fullAdder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: full_adder4
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testbench;

	// Inputs
	reg [3:0] a;
	reg [3:0] b;
	reg c_in;

	// Outputs
	wire [3:0] s;
	wire c_out;

	// Instantiate the Unit Under Test (UUT)
	full_adder4 uut (
		.a(a), 
		.b(b), 
		.c_in(c_in), 
		.s(s), 
		.c_out(c_out)
	);

	initial begin
		// Initialize Inputs
		#5;
		a = 0;
		b = 0;
		c_in = 0;

		// Wait 100 ns for global reset to finish
		#10;
        
		// Add stimulus here
		a = 2;
		b = 3;
		c_in = 0;
		
		#10;

	end
      
endmodule

