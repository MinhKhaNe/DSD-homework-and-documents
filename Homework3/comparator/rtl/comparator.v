module comparator(
	input	wire	[1:0]	a,
	input	wire	[1:0]	b,
	output	wire		e,
	output	wire		g_a,
	output	wire		l_a
);

	assign e   	= (a == b) 	? 1 : 0;
	assign g_a 	= (a > b) 	? 1 : 0;
	assign l_a 	= (a < b) 	? 1 : 0;

endmodule