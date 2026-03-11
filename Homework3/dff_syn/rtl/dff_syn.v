module dff_syn(
	input	wire	clk,
	input	wire	rst_n,
	input 	wire	[1:0]	in,
	output	reg	[1:0]	out
);

	always @(posedge clk) begin
		if(!rst_n)
			out	<= 2'b00;
		else	
			out	<= in;
	end

endmodule

