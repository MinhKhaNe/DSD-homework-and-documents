module majority_circuit(
	input	wire	a,
	input	wire	b,
	input	wire	c,
	output	wire	gate_out,
	output	wire	data_out,
	output	reg	behav_out
);
	wire	f1, f2, f3;

	//structural
	and(f1, a, b);
	and(f2, a, c);
	and(f3, c, b);
	or(gate_out, f1, f2, f3);

	//dataflow
	assign	data_out = (a & b) | (a & c) | (b & c);

	//behavioural
	always @(*) begin
		behav_out = (a & b) | (a & c) | (b & c);
	end	

endmodule