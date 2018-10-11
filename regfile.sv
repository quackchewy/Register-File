module regfile (ReadData1, ReadData2, WriteData, ReadRegister1, ReadRegister2, WriteRegister, RegWrite, clk);
	output logic [63:0] ReadData1, ReadData2;
	input logic [63:0] WriteData;
	input logic [4:0] ReadRegister1, ReadRegister2;
	input logic [4:0] WriteRegister;
	input logic RegWrite, clk;

	// Decoder chooses 1 register to write to.
	logic [31:0] decOut;
	
	logic [31:0][63:0] regOutMuxIn;
	
	logic [63:0][31:0] flippedMatrix;
	
	assign regOutMuxIn[31] = 64'b0;

	decoder5_32 dec (.out(decOut), .in(WriteRegister), .regWrite(RegWrite));
	
	genvar i, j, m, n;
	generate
		// Create 31 registers: X0 to X30.
		// TODO: make outputs go to 2 muxes.
		for (i = 0; i < 31; i++) begin : eachReg
			register regI (.dataIn(WriteData), .dataOut(regOutMuxIn[i]), .writeEnable(decOut[i]), .clk);
		end
		
		for (m = 0; m < 32; m++) begin : flipRows
			for (n = 0; n < 64; n++) begin : flipColumns
				assign flippedMatrix[n][m] = regOutMuxIn[m][n];
			end
		end
		
		for (j = 0; j < 64; j++) begin : eachMuxPair					
			mux32_1 mux1 (.out(ReadData1[j]), .in(flippedMatrix[j]), .sel(ReadRegister1));
			mux32_1 mux2 (.out(ReadData2[j]), .in(flippedMatrix[j]), .sel(ReadRegister2));
		end
		
	endgenerate

endmodule 

module regfile_testbench();
	logic [63:0] ReadData1, ReadData2;
	logic [63:0] WriteData;
	logic [4:0] ReadRegister1, ReadRegister2;
	logic [4:0] WriteRegister;
	logic RegWrite, clk;
	
	parameter period = 100; 
	
	initial begin
		clk <= 0;
		forever #(period/2) clk <= ~clk;
	end 
	
	regfile dut (.ReadData1, .ReadData2, .WriteData, .ReadRegister1, .ReadRegister2, .WriteRegister, .RegWrite, .clk);
		
	initial begin
		RegWrite = 0; WriteRegister = 30; WriteData = 124; @(posedge clk);
		ReadRegister1 = 30; @(posedge clk);
		
		RegWrite = 1; WriteRegister = 30; WriteData = 124; @(posedge clk);
		ReadRegister1 = 30; @(posedge clk);
		
		RegWrite = 1; WriteRegister = 28; WriteData = 207; @(posedge clk);
		ReadRegister1 = 30; ReadRegister2 = 28; @(posedge clk);
		
		RegWrite = 1; WriteRegister = 0; WriteData = 'b1001; @(posedge clk);
		ReadRegister1 = 0; ReadRegister2 = 12; @(posedge clk);
		ReadRegister1 = 0; ReadRegister2 = 30; @(posedge clk);
		ReadRegister1 = 31; @(posedge clk);
		
		RegWrite = 1; WriteRegister = 31; WriteData = -14; @(posedge clk);
		ReadRegister1 = 31; @(posedge clk);		
	end

endmodule 