`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:02:48 04/25/2016 
// Design Name: 
// Module Name:    full_adder 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: ripple carry full adder example based on tutorial by EDA Playground
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module full_adder(
    input a,
    input b,
    input c_in,
    output s,
    output c_out
    );

    wire net1, net2, net3;
	 
	 xor (net1, a, b);
	 xor (s, net1, c_in);
	 and (net3, a, b);
	 and (net2, net1, c_in);
	 or (c_out, net2, net3);

endmodule

module full_adder4(
    input [3:0] a,
	 input [3:0] b,
	 input c_in,
	 output [3:0] s,
	 output c_out);
	 
	 wire [2:0] carry;
	 
	 full_adder fa0 (
	     .a(a[0]),
		  .b(b[0]),
		  .c_in(c_in),
		  .s(s[0]),
		  .c_out(carry[0]));
		  
	 full_adder fa1 (
	     .a(a[1]),
		  .b(b[1]),
		  .c_in(carry[0]),
		  .s(s[1]),
		  .c_out(carry[1]));
		  
	 full_adder fa2 (
	     .a(a[2]),
		  .b(b[2]),
		  .c_in(carry[1]),
		  .s(s[2]),
		  .c_out(carry[2]));
		  
	 full_adder fa3 (
	     .a(a[3]),
		  .b(b[3]),
		  .c_in(carry[2]),
		  .s(s[3]),
		  .c_out(c_out));

endmodule
