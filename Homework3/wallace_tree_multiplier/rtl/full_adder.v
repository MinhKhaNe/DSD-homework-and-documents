module full_adder(
	input	wire	a,
	input 	wire	b,
	input 	wire	cin,
	output	wire	sum,
	output	wire	carry
);
	wire	s1, c1, c2;

	xor(s1, a, b);
	xor(sum, s1, cin);
	and(c1, a, b);
	and(c2, s1, cin);
	or(carry, c1, c2);

endmodule

