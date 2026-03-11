module full_adder(
	input	wire	a,
	input 	wire	b,
	input 	wire	cin,
	output	wire	sum,
	output	wire	carry
);

	wire carry_1, carry_2, sum_1;	
	
	assign sum_1 = a ^ b;
	assign carry_1 = a & b;

	//half_adder_2
	assign carry_2 = sum_1 & cin;

	//full_adder
	assign sum = sum_1 ^ cin;
	assign carry = carry_1 | carry_2;

endmodule

