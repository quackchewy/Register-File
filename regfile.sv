module regfile (readData1, readData2, writeData, readReg1, readReg2, writeReg, regWriteEnable, reset, clk);
	output logic [63:0] readData1, readData2;
	input logic [63:0] writeData;
	input logic [4:0] readReg1, readReg2;
	input logic [4:0] writeReg;
	input logic regWriteEnable, reset, clk;

	// Decoder chooses 1 register to write to.
	logic [31:0] decOut;
	
	logic [31:0][63:0] regOutMuxIn;
	
	logic [63:0][31:0] flippedMatrix;
	
	assign regOutMuxIn[31] = 64'b0;

	decoder5_32 dec (.out(decOut), .in(writeReg), .regWrite(regWriteEnable));
	
	genvar i, j, m, n;
	generate
		// Create 31 registers: X0 to X30.
		// TODO: make outputs go to 2 muxes.
		for (i = 0; i < 31; i++) begin : eachReg
			register regI (.dataIn(writeData), .dataOut(regOutMuxIn[i]), .writeEnable(decOut[i]), .reset, .clk);
		end
		
		for (m = 0; m < 32; m++) begin : flipRows
			for (n = 0; n < 64; n++) begin : flipColumns
				assign flippedMatrix[n][m] = regOutMuxIn[m][n];
			end
		end
		
		for (j = 0; j < 64; j++) begin : eachMuxPair					
			mux32_1 mux1 (.out(readData1[j]), .in(flippedMatrix[j]), .sel(readReg1));
			mux32_1 mux2 (.out(readData2[j]), .in(flippedMatrix[j]), .sel(readReg2));
		end
		
	endgenerate

endmodule 

module regfile_testbench();
	logic [63:0] readData1, readData2;
	logic [63:0] writeData;
	logic [4:0] readReg1, readReg2;
	logic [4:0] writeReg;
	logic regWriteEnable, reset, clk;
	
	parameter period = 100; 
	
	initial begin
		clk <= 0;
		forever #(period/2) clk <= ~clk;
	end 
	
	regfile dut (.readData1, .readData2, .writeData, .readReg1, .readReg2, .writeReg, .regWriteEnable, .reset, .clk);
	
	initial begin
		regWriteEnable = 0; writeReg = 30; writeData = 124; @(posedge clk);
		readReg1 = 30; @(posedge clk);
		
		regWriteEnable = 1; writeReg = 30; writeData = 124; @(posedge clk);
		readReg1 = 30; @(posedge clk);
		
		regWriteEnable = 1; writeReg = 28; writeData = 207; @(posedge clk);
		readReg1 = 30; readReg2 = 28; @(posedge clk);
		
		regWriteEnable = 1; writeReg = 0; writeData = 'b1001; @(posedge clk);
		readReg1 = 0; readReg2 = 12; @(posedge clk);
		readReg1 = 0; readReg2 = 30; @(posedge clk);
		readReg1 = 31; @(posedge clk);
		
		regWriteEnable = 1; writeReg = 31; writeData = -14; @(posedge clk);
		readReg1 = 31; @(posedge clk);		
	end

endmodule 