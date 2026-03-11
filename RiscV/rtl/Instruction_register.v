module Instruction_register (
	input	wire		clk,
	input	wire		reset,
	input	wire		IRWrite,
    	input	wire 	[31:0] 	Instruction,

	output	reg	[31:0]	Instruction_out
);

	always @(posedge clk or posedge reset) begin    
		if(reset) 
			Instruction_out	<= 32'h0;
		else if(IRWrite)
			Instruction_out	<= Instruction;
	end
endmodule
