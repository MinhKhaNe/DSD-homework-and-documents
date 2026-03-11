module subtractor_1bit(
	input	wire	a,
	input	wire	b,
	input	wire	bin,
	output	wire	gate_out,
	output	wire	data_out,
	output	reg	behav_out,
	output	wire	gate_carry,
	output	wire	data_carry,
	output	reg	behav_carry
);
	wire	n_a;
	wire	f1, f2, f3;

	//structural
	xor(gate_out, a, b, bin);

	not(n_a, a);

	and(f1, n_a, b);
	and(f2, n_a, bin);
	and(f3, b, bin);
	or(gate_carry, f1, f2, f3);

	//data_flow
	assign 	data_out = a ^ b ^ bin;
	assign	data_carry = (~a & b) | (~a & bin) | (b & bin);

	//behavioral
	always @(*) begin
		behav_out = a ^ b ^ bin;
		behav_carry = (~a & b) | (~a & bin) | (b & bin);
	end

endmodule