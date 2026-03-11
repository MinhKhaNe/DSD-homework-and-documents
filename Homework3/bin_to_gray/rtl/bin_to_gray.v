module  bin_to_gray(
	input	wire	[3:0]	bin,

	output	wire	[3:0]	gate_sum,
	output	wire	[3:0]	data_sum,
	output	reg	[3:0]	behav_sum
);

	//structural
	buf(gate_sum[3], bin[3]); 
	xor(gate_sum[2], bin[3], bin[2]);   
	xor(gate_sum[2], bin[3], bin[2]);
	xor(gate_sum[1], bin[1], bin[2]);   
	xor(gate_sum[0], bin[1], bin[0]);	

	//dataflow
	assign data_sum[3]	= bin[3];
	assign data_sum[2]	= bin[3] ^ bin[2];
	assign data_sum[1]	= bin[1] ^ bin[2];
	assign data_sum[0]	= bin[1] ^ bin[0];
	
	//behavioral 	
	always @(*) begin
		behav_sum[3]	= bin[3];
		behav_sum[2]	= bin[3] ^ bin[2];
		behav_sum[1]	= bin[1] ^ bin[2];
		behav_sum[0]	= bin[1] ^ bin[0];
	end
endmodule