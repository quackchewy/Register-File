`timescale 1ns/10ps

module decoder2_4 (out, in, en);
	output logic [3:0] out;
	input logic [1:0] in;
	input logic en;
	
	logic notIn0, notIn1;
	
	not #50 not0 (notIn0, in[0]);
	not #50 not1 (notIn1, in[1]);
	
	and #50 and0 (out[0], notIn1, notIn0, en);
	and #50 and1 (out[1], notIn1, in[0], en);
	and #50 and2 (out[2], in[1], notIn0, en);
	and #50 and3 (out[3], in[1], in[0], en);
	
endmodule 

module decoder2_4_testbench ();
	logic [3:0] out;
	logic [1:0] in;
	logic en;
	
	decoder2_4 dut (.out, .in, .en);
	
	initial begin
		integer i;
		for (i = 0; i < 4; i++) begin
			in = i; en = 0; #3000;
		end
		
		in = 0; #50;
		
		for (i = 0; i < 4; i++) begin
			in = i; en = 1; #3000;
		end
	end
	
endmodule 