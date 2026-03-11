module lf_shift_register(
	input	wire		clk,
	input	wire		rst_n,
	input	wire		enable,
	input	wire		in_seed,
	input	wire	[3:0]	seed,
	output	reg	[3:0]	Q,	
	output	reg		feedback
);

	always @(posedge clk or negedge rst_n) begin
		if(!rst_n) begin
			Q 		<= 4'b0000;
			feedback	<= 1'b0;	
		end
		else begin
			if(in_seed) begin
				Q		<= seed;
			end
			if(enable) begin
				feedback	<= Q[3] ^ Q[2];
				Q		<= {Q[3] ^ Q[2], Q[3:1]};
			end
		end
	end	

endmodule

