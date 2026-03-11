module asyn_counter(
	input	wire		clk,
	input	wire		rst_n,
	output	wire	[3:0]	Q
);

	t_ff t1(.clk(clk), .rst_n(rst_n), .T(1'b1), .Q(Q[0]));		
	t_ff t2(.clk(Q[0]), .rst_n(rst_n), .T(1'b1), .Q(Q[1]));
	t_ff t3(.clk(Q[1]), .rst_n(rst_n), .T(1'b1), .Q(Q[2]));		
	t_ff t4(.clk(Q[2]), .rst_n(rst_n), .T(1'b1), .Q(Q[3]));

endmodule

