module half_subtractor(
	input	wire	a,
	input	wire	b,
	output	wire	gate_out,
	output	wire	gate_carry,
	output	wire	data_out,
	output	wire	data_carry,
	output	reg	behav_out,
	output	reg	behav_carry
);
	wire	n_a;
	
	//structural
	xor(gate_out, a, b);
	not(n_a, a);
	and(gate_carry, n_a, b);

	//dataflow
	assign	data_out 	= a ^ b;
	assign	data_carry	= ~a & b;

	//behavioural
	always @(*) begin
		behav_out 	= a ^ b;
		behav_carry	= ~a & b;
	end

endmodule