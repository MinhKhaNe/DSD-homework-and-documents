module third_module(
	input 	wire	A,
	input	wire	B,
	input	wire	C,
	output	wire	F
);

	wire	F1, F2;

	assign F1 = A && B;
	assign F2 = ~A && C;

	assign F = F1 || F2 ;

endmodule