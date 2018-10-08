module dff_enable(out, in, reset, clk, writeEnable);
	output logic out;
	input logic in, reset, clk, writeEnable;
	
	logic muxOut;
	
	D_FF ff (.q(out), .d(muxOut), .reset, .clk);
	
	mux2_1 mux21 (.out(muxOut), .i0(out), .i1(in), .sel(writeEnable));
	
endmodule 

module dff_enable_testbench;
	logic out, in, reset, clk, writeEnable;
	
	dff_enable dut (.out, .in, .reset, .clk, .writeEnable);

	parameter period = 100;
	
	initial begin
		clk <= 0;
		forever #(period / 2) clk <= ~clk;
	end
	
	initial begin
		reset = 1; repeat (3) @(posedge clk); 
		reset = 0; repeat (3) @(posedge clk);
		
		writeEnable = 1; repeat (3) @(posedge clk);
		in = 1; repeat (3) @(posedge clk);
		in = 0; repeat (3) @(posedge clk);
		writeEnable = 0; repeat (3) @(posedge clk);
		in = 1; repeat (3) @(posedge clk);
		in = 0; repeat (3) @(posedge clk);
		writeEnable = 1; repeat (3) @(posedge clk);
		in = 0; repeat (3) @(posedge clk);
		in = 1; repeat (3) @(posedge clk);		
		writeEnable = 0; repeat (3) @(posedge clk);
		in = 0; repeat (3) @(posedge clk);
		in = 1; repeat (3) @(posedge clk);		
	end
endmodule 

module D_FF (q, d, reset, clk);
  output reg q;
  input d, reset, clk;
  
  always_ff @(posedge clk)
  if (reset)
    q <= 0; // On reset, set to 0
  else
    q <= d; // Otherwise out = d
	 
endmodule 