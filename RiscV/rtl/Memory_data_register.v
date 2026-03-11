module Memory_data_register (
	input	wire		clk,
	input	wire		reset,
    	input	wire 	[31:0] 	MemData,

	output	reg	[31:0]	MemData_out
);

	always @(posedge clk or posedge reset) begin    
		if(reset) 
			MemData_out	<= 32'h0;
		else 
			MemData_out	<= MemData;
	end
endmodule
