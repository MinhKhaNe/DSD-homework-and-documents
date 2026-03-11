module ripple_carry_4bit(
	input	wire	[3:0]	a,
	input	wire	[3:0]	b,
	input	wire		cin,
	output	wire	[3:0]	gate_sum,
	output	wire	[3:0]	data_sum,
	output	wire	[3:0]	behav_sum,
	output	wire		gate_carry,
	output	wire		data_carry,
	output	wire		behav_carry
);
	wire 	c1, c2, c3; 	//cout gate model
	wire 	c4, c5, c6; 	//cout dataflow
	wire 	c7, c8, c9;	//cout behavioural model

	full_adder FA0(
		.a(a[0]),
		.b(b[0]),
		.cin(cin),
		.gate_sum(gate_sum[0]),
		.data_sum(data_sum[0]),
		.behav_sum(behav_sum[0]),
		.gate_carry(c1),
		.data_carry(c4),
		.behav_carry(c7)
	);
	
	full_adder FA1(
		.a(a[1]),
		.b(b[1]),
		.cin(c1),
		.gate_sum(gate_sum[1]),
		.data_sum(data_sum[1]),
		.behav_sum(behav_sum[1]),
		.gate_carry(c2),
		.data_carry(c5),
		.behav_carry(c8)
	);

	full_adder FA2(
		.a(a[2]),
		.b(b[2]),
		.cin(c2),
		.gate_sum(gate_sum[2]),
		.data_sum(data_sum[2]),
		.behav_sum(behav_sum[2]),
		.gate_carry(c3),
		.data_carry(c6),
		.behav_carry(c9)
	);
	
	full_adder FA3(
		.a(a[3]),
		.b(b[3]),
		.cin(c3),
		.gate_sum(gate_sum[3]),
		.data_sum(data_sum[3]),
		.behav_sum(behav_sum[3]),
		.gate_carry(gate_carry),
		.data_carry(data_carry),
		.behav_carry(behav_carry)
	);

endmodule