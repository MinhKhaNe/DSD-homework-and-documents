module syn_counter(
	input	wire		clk,
	input	wire		rst_n,
	output	reg	[3:0]	Q
);

	always @(posedge clk or negedge rst_n) begin
		if(!rst_n) 
			Q	<= 4'b0000;
		else
			Q 	<= Q + 4'b0001;
	end

endmodule

