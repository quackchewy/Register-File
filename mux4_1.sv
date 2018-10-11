module mux4_1 (out, i0, i1, i2, i3, sel0, sel1);
	output logic out;
	input logic i0, i1, i2, i3, sel0, sel1;
	
	// Intermediate wires from input muxes to output mux.
	logic wire0, wire1;
	
	mux2_1 inputA (.out(wire0), .i0, .i1, .sel(sel0));
	mux2_1 inputB (.out(wire1), .i0(i2), .i1(i3), .sel(sel0));
	mux2_1 outputA (.out, .i0(wire0), .i1(wire1), .sel(sel1));

endmodule 

module mux4_1_testbench();
	logic out, i0, i1, i2, i3, sel0, sel1;
	
	mux4_1 dut (.out, .i0, .i1, .i2, .i3, .sel0, .sel1);
	
	integer i;
	initial begin
		for (i = 0; i < 64; i++) begin
			{sel1, sel0, i0, i1, i2, i3} = i; #5000;
		end
	end
endmodule 
