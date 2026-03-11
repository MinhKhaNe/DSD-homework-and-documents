module array_multiplier(
	input	wire	[1:0]	a,
	input	wire	[1:0]	b,
	output	wire	[3:0]	gate_out,
	output	wire	[3:0]	data_out,
	output	reg	[3:0]	behav_out
);
	wire	[1:0]	d0, d1;
	wire	[1:0]	g0, g1;
	reg	[1:0]	b0, b1;
	wire	[2:0]	g1_shift;
	wire		s1, c1;

	//structural
	and(g0[0], a[0], b[0]);
	and(g0[1], a[1], b[0]);
	and(g1[0], a[0], b[1]);
	and(g1[1], a[1], b[1]);
	xor(s1, g0[1], g1[0]);
	and(c1, g0[1], g1[0]);
	buf(gate_out[0], g0[0]);
	buf(gate_out[1], s1);
	xor(gate_out[2], g1[1], c1);
	and(gate_out[3], g1[1], c1);

	//dataflow
	assign d0 = a & {2{b[0]}};
	assign d1 = a & {2{b[1]}};

	assign data_out = (d0 << 0) + (d1 << 1);

	//behavioral
	always @(*) begin
		b0 = a & {2{b[0]}};
		b1 = a & {2{b[1]}};

		behav_out = (d0 << 0) + (d1 << 1);
	end
	
endmodule