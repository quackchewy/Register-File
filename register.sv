module register (dataIn, dataOut, writeEnable, reset, clk);
	output logic [63:0] dataOut;
	input logic [63:0] dataIn;
	input logic writeEnable, reset, clk;
	
	genvar i;
	generate	
		for (i = 0; i < 64; i++) begin : eachDff
			dff_enable dffEn (.out(dataOut[i]), .in(dataIn[i]), .reset, .clk, .writeEnable);
		end
	endgenerate
endmodule 

module register_testbench;
	logic [63:0] dataOut, dataIn;
	logic writeEnable, reset, clk;
	
	register dut (.dataIn, .dataOut, .writeEnable, .reset, .clk);
	
	parameter period = 20; 
	
	initial begin
		clk <= 0;
		forever #(period/2) clk <= ~clk;
	end 
			
	integer i;
	initial begin
		reset = 1; #10; reset = 0; writeEnable = 1;
				
		for (i = 0; i < 64; i++) begin
			dataIn = i; @(posedge clk);
		end
		
		reset = 1; #10; reset = 0; writeEnable = 0;
		
		for (i = 0; i < 64; i++) begin
			dataIn = i; @(posedge clk);
		end
		
	end	
endmodule 