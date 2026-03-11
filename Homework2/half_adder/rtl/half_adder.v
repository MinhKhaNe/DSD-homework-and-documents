module half_adder(
	input	wire	a,
	input 	wire	b,
	output	wire	gate_sum,
	output	wire	data_sum,
	output	reg	behav_sum,
	output	wire	gate_carry,
	output	wire	data_carry,
	output	reg	behav_carry
);

	xor(gate_sum, a, b);
	and(gate_carry, a, b);

	assign data_sum = a ^ b;
	assign data_carry = a & b;

	always @(*) begin
		behav_carry = a & b;
		behav_sum = a ^ b;
	end

endmodule