module subtractor_2bit(
	input	wire	[1:0]	a,
	input	wire	[1:0]	b,
	output	wire	[1:0]	gate_out,
	output	wire		gate_carry,
	output	wire	[1:0]	data_out,
	output	wire		data_carry,
	output	reg	[1:0]	behav_out,
	output	reg		behav_carry
);
	wire	n_a0, n_a1;
	wire	b1;
	wire	b1_1, b1_2, b1_3, b1_4, b1_5, b2_1, b2_2, b2_3, b2_4;
	reg	b3;
	
	//structural
	not(n_a0, a[0]);
	not(n_a1, a[1]);

	xor(gate_out[0], a[0], b[0], 1'b0);
	and(b1_1, n_a0, b[0]);
	xor(b1_2, a[0], b[0]);
	not(b1_3, b1_2);
	and(b1_4, b1_3, 1'b0);
	or(b1_5, b1_1, b1_4);

	xor(gate_out[1], a[1], b[1], b1_5);
	and(b2_1, n_a1, b[1]);
	xor(b2_2, a[1], b[1]);
	not(b2_3, b2_2);
	and(b2_4, b2_3, b1_5);
	or(gate_carry, b2_1, b2_4);

	//dataflow
	//full subtraction 1
	assign	data_out[0] = a[0] ^ b[0] ^ 1'b0;
	assign 	b1 = (~a[0] & b[0] ) | (~(a[0] ^ b[0]) & 1'b0);

	//full subtraction 2
	assign	data_out[1] = a[1] ^ b[1] ^ b1;
	assign 	data_carry = (~a[1] & b[1] ) | (~(a[1] ^ b[1]) & b1);

	//behavioral
	always @(*) begin
		behav_out[0] = a[0] ^ b[0] ^ 1'b0;
	 	b3 = (~a[0] & b[0] ) | (~(a[0] ^ b[0]) & 1'b0);
	end

	always @(*) begin
		behav_out[1] = a[1] ^ b[1] ^ b1;
	 	behav_carry = (~a[1] & b[1] ) | (~(a[1] ^ b[1]) & b3);
	end

endmodule