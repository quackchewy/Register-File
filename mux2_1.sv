`timescale 1ns/10ps

module mux2_1(out, i0, i1, sel);
	output logic out;
	input logic i0, i1, sel;

	//assign out = (i1 & sel) | (i0 & ~sel);	

	logic wire0;
	and #50 and0 (wire0, i1, sel);
	
	logic notSel, wire1;
	not #50 not0 (notSel, sel);
	and #50 and1 (wire1, i0, notSel);
	
	or #50 or1 (out, wire0, wire1);

endmodule

module mux2_1_testbench();
	logic i0, i1, sel;
	logic out;

	mux2_1 dut (.out, .i0, .i1, .sel);

	initial begin
		sel=0; i0=0; i1=0; #3000;
		sel=0; i0=0; i1=1; #3000;
		sel=0; i0=1; i1=0; #3000;
		sel=0; i0=1; i1=1; #3000;
		sel=1; i0=0; i1=0; #3000;
		sel=1; i0=0; i1=1; #3000;
		sel=1; i0=1; i1=0; #3000;
		sel=1; i0=1; i1=1; #3000;
	end
endmodule 