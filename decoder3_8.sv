`timescale 1ns/10ps

module decoder3_8 (out, in, en);
	output logic [7:0] out;
	input logic [2:0] in;
	input logic en;

	logic notIn0, notIn1, notIn2;
	not #50 not0 (notIn0, in[0]);
	not #50 not1 (notIn1, in[1]);
	not #50 not2 (notIn2, in[2]);
	
	and #50 and0 (out[0], notIn2, notIn1, notIn0, en); 
	and #50 and1 (out[1], notIn2, notIn1, in[0], en); 
	and #50 and2 (out[2], notIn2, in[1], notIn0, en); 
	and #50 and3 (out[3], notIn2, in[1], in[0], en); 
	and #50 and4 (out[4], in[2], notIn1, notIn0, en); 
	and #50 and5 (out[5], in[2], notIn1, in[0], en); 
	and #50 and6 (out[6], in[2], in[1], notIn0, en); 
	and #50 and7 (out[7], in[2], in[1], in[0], en); 
	
endmodule 

module decoder3_8_testbench ();
	logic [7:0] out;
	logic [2:0] in;
	logic en;
	
	decoder3_8 dut (.out, .in, .en);
	
	initial begin
		integer i;
		for (i = 0; i < 8; i++) begin
			in = i; en = 0; #3000;
		end
				
		for (i = 0; i < 8; i++) begin
			in = i; en = 1; #3000;
		end
	end
	
endmodule 