module mux32_1 (out, in, sel);
	output logic out;
	input logic [31:0] in;
	input logic [4:0] sel;
	
	// Intermediate wires from input muxes to output mux.
	logic wireA, wireB;
	
	mux16_1 inputA (.out(wireA), .in(in[15:0]), .sel(sel[3:0]));
	mux16_1 inputB (.out(wireB), .in(in[31:16]), .sel(sel[3:0]));
	
	mux2_1 outputA (.out, .i0(wireA), .i1(wireB), .sel(sel[4]));

endmodule 

module mux32_1_testbench();
	logic out;
	logic [31:0] in;
	logic [4:0] sel;
	
	mux32_1 dut (.out, .in, .sel);
	
	integer i, j;
	initial begin
		for (j = 0; j < 32; j++) begin
			for (i = 0; i < 65536; i++) begin
				sel = j; in = i; #5000;
			end
		end
	end
endmodule 
