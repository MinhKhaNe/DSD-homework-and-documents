module t_ff(
	input	wire	clk,
	input	wire	rst_n,
	input	wire	T,
	output	reg	Q
);

	always @(posedge clk or negedge rst_n) begin
		if(!rst_n)
			Q <= 1'b0;
		else if(T)
			Q <= ~Q;
		else 
			Q <= Q;
	end		

endmodule

