module decoder3_8 (out, in, en);
	output logic [7:0] out;
	input logic [2:0] in;
	input logic en;

	and and0 (out[0], ~in[2], ~in[1], ~in[0], en); 
	and and1 (out[1], ~in[2], ~in[1], in[0], en); 
	and and2 (out[2], ~in[2], in[1], ~in[0], en); 
	and and3 (out[3], ~in[2], in[1], in[0], en); 
	and and4 (out[4], in[2], ~in[1], ~in[0], en); 
	and and5 (out[5], in[2], ~in[1], in[0], en); 
	and and6 (out[6], in[2], in[1], ~in[0], en); 
	and and7 (out[7], in[2], in[1], in[0], en); 
	
endmodule 

module decoder3_8_testbench ();
	logic [7:0] out;
	logic [2:0] in;
	logic en;
	
	decoder3_8 dut (.out, .in, .en);
	
	initial begin
		integer i;
		for (i = 0; i < 8; i++) begin
			in = i; en = 0; #10;
		end
		
		#50;
		
		for (i = 0; i < 8; i++) begin
			in = i; en = 1; #10;
		end
	end
	
endmodule 