module decoder2_4 (out, in, en);
	output logic [3:0] out;
	input logic [1:0] in;
	input logic en;
	
	and and0 (out[0], ~in[1], ~in[0], en);
	and and1 (out[1], ~in[1], in[0], en);
	and and2 (out[2], in[1], ~in[0], en);
	and and3 (out[3], in[1], in[0], en);
	
endmodule 

module decoder2_4_testbench ();
	logic [3:0] out;
	logic [1:0] in;
	logic en;
	
	decoder2_4 dut (.out, .in, .en);
	
	initial begin
		integer i;
		for (i = 0; i < 4; i++) begin
			in = i; en = 0; #10;
		end
		
		in = 0; #50;
		
		for (i = 0; i < 4; i++) begin
			in = i; en = 1; #10;
		end
	end
	
endmodule 