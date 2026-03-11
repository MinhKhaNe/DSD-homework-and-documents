module xor_gate(
	input	wire	a,
	input 	wire	b,
	output	wire	gate_out,
	output	wire	data_out,
	output	reg	behav_out
);

	xor(gate_out, a, b);

	assign data_out = a ^ b;

	always @(*) begin
		behav_out = a ^ b;
	end

endmodule