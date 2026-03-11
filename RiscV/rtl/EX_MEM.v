module EX_MEM(
	input  	wire        	clk,
    	input  	wire        	RegWrite,
    	input  	wire        	MemRead,
    	input  	wire        	MemWrite,
    	input  	wire        	MemtoReg,
    	input  	wire        	Branch,
    	input  	wire 	[31:0] 	Alu_result,
    	input  	wire 	[31:0] 	Mux2,
    	input  	wire        	Zero,
    	input  	wire 	[31:0] 	Pc_branch,
    	input  	wire 	[4:0]  	Rd,

    	output 	reg         	RegWrite_out,
    	output 	reg         	MemRead_out,
    	output 	reg         	MemWrite_out,
    	output 	reg         	MemtoReg_out,
    	output 	reg         	Branch_out,
    	output 	reg 	[31:0]  alu_result_out,
    	output 	reg 	[31:0]  Mux2_out,
    	output 	reg         	zero_out,
    	output 	reg 	[31:0]  pc_branch_out,
    	output 	reg 	[4:0]   rd_out
);

	always @(posedge clk) begin
       		RegWrite_out   	<= RegWrite;
       		MemRead_out    	<= MemRead;
        	MemWrite_out   	<= MemWrite;
        	MemtoReg_out   	<= MemtoReg;
        	Branch_out     	<= Branch;
        	alu_result_out 	<= Alu_result;
        	Mux2_out   	<= Mux2;
        	zero_out       	<= Zero;
        	pc_branch_out  	<= Pc_branch;
        	rd_out         	<= Rd;
	end

endmodule