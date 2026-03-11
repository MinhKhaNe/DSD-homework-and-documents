module first_module(
	input 	wire	A,
	input	wire	B,
	input	wire	C,
	output	wire	F
);

	wire	F1, F2, F3;

	assign F1 = A && B && C;
	assign F2 = A && B && ~C;
	assign F3 = ~A && C;	

	assign F = F1 || F2 || F3;

endmodule