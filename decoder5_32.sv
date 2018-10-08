module decoder5_32 (out, in, regWrite);
	output logic [31:0] out;
	input logic [4:0] in;
	
	// Allows writing to a register when true.
	input logic regWrite;
	
	// Connects the output of the 2 to 4 decoder to the enables of the 3 to 8 decoders.
	logic [3:0] select;
	
	decoder2_4 dec24 (.out(select[3:0]), .in(in[4:3]), .en(regWrite));
	
	decoder3_8 dec38_a (.out(out[7:0]), .in(in[2:0]), .en(select[0]));
	decoder3_8 dec38_b (.out(out[15:8]), .in(in[2:0]), .en(select[1]));
	decoder3_8 dec38_c (.out(out[23:16]), .in(in[2:0]), .en(select[2]));
	decoder3_8 dec38_d (.out(out[31:24]), .in(in[2:0]), .en(select[3]));

endmodule

module decoder5_32_testbench ();
	logic [31:0] out;
	logic [4:0] in;
	logic regWrite;
	
	decoder5_32 dut (.out, .in, .regWrite);
	
	initial begin
		integer i;
		for (i = 0; i < 32; i++) begin
			in = i; regWrite = 1; #10;
		end
		
		in = 0; #50;
		
		for (i = 0; i < 32; i++) begin
			in = i; regWrite = 0; #10;
		end		
	end
	
endmodule 








