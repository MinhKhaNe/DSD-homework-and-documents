module demux_1to4_2(
	input	wire 		a,
	input	wire	[1:0] 	s,
	output	wire		gate_out_0,
	output	wire		gate_out_1,
	output	wire		gate_out_2,
	output	wire		gate_out_3,
	output	wire		data_out_0,
	output	wire		data_out_1,
	output	wire		data_out_2,
	output	wire		data_out_3,
	output	wire		behav_out_0,
	output	wire		behav_out_1,
	output	wire		behav_out_2,
	output	wire		behav_out_3

);

	wire	g1, g2;
	wire	d1, d2;
	wire	b1, b2;

	demux_1to2 dm0(
		.a(a),
		.s(s[1]),
		.gate_out_0(g1),
		.gate_out_1(g2),
		.data_out_0(d1),
		.data_out_1(d2),
		.behav_out_0(b1),
		.behav_out_1(b2)
	);

	demux_1to2 dm1(
		.a(g1),
		.s(s[0]),
		.gate_out_0(gate_out_0),
		.gate_out_1(gate_out_1),
		.data_out_0(data_out_0),
		.data_out_1(data_out_1),
		.behav_out_0(behav_out_0),
		.behav_out_1(behav_out_1)
	);	

	demux_1to2 dm2(
		.a(g2),
		.s(s[0]),
		.gate_out_0(gate_out_2),
		.gate_out_1(gate_out_3),
		.data_out_0(data_out_2),
		.data_out_1(data_out_3),
		.behav_out_0(behav_out_2),
		.behav_out_1(behav_out_3)
	);
	
endmodule