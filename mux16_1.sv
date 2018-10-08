module mux16_1 (out, in, sel);
	output logic out;
	input logic [15:0] in;
	input logic [3:0] sel;
	
	// Intermediate wires from input muxes to output mux.
	logic wireA, wireB, wireC, wireD;
	
	mux4_1 inputA (.out(wireA), .i0(in[0]), .i1(in[1]), .i2(in[2]), .i3(in[3]), .sel0(sel[0]), .sel1(sel[1]));
	mux4_1 inputB (.out(wireB), .i0(in[4]), .i1(in[5]), .i2(in[6]), .i3(in[7]), .sel0(sel[0]), .sel1(sel[1]));
	mux4_1 inputC (.out(wireC), .i0(in[8]), .i1(in[9]), .i2(in[10]), .i3(in[11]), .sel0(sel[0]), .sel1(sel[1]));
	mux4_1 inputD (.out(wireD), .i0(in[12]), .i1(in[13]), .i2(in[14]), .i3(in[15]), .sel0(sel[0]), .sel1(sel[1]));
	
	mux4_1 outputA (.out, .i0(wireA), .i1(wireB), .i2(wireC), .i3(wireD), .sel0(sel[2]), .sel1(sel[3]));

endmodule 

module mux16_1_testbench();
	logic out;
	logic [15:0] in;
	logic [3:0] sel;
	
	mux16_1 dut (.out, .in, .sel);
	
	integer i, j;
	initial begin
		for (j = 0; j < 16; j++) begin
			for (i = 0; i < 65536; i++) begin
				sel = j; in = i; #10;
			end
		end
	end
endmodule 