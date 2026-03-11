module adder_subtractor_4bit(
	input	wire	[3:0] 	a,
	input	wire	[3:0] 	b,
	input	wire		mode,		//mode 0 = add, mode 1 = sub
	output	wire	[3:0] 	gate_out,
	output	wire	[3:0] 	data_out,
	output	reg	[3:0] 	behav_out,
	output	wire	 	gate_carry,
	output	wire	 	data_carry,
	output	reg		behav_carry
);
	
	wire	gate_carry_1, gate_carry_2, gate_carry_3;
	wire	data_carry_1, data_carry_2, data_carry_3;
	reg	behav_carry_1, behav_carry_2, behav_carry_3;
	wire	f1_0, f2_0, f3_0, f1_1, f2_1, f3_1, f1_2, f2_2, f3_2, f1_3, f2_3, f3_3;
	wire	[3:0]	b_1, b_2;
	reg	[3:0]	b_3;
	
	//structural
	assign b_1 	= b ^ {4{mode}};
	xor(gate_out[0], a[0], b_1[0], mode);
	xor(gate_out[1], a[1], b_1[1], gate_carry_1);
	xor(gate_out[2], a[2], b_1[2], gate_carry_2);
	xor(gate_out[3], a[3], b_1[3], gate_carry_3);

	and(f1_0, a[0], b_1[0]);
	and(f2_0, a[0], mode);
	and(f3_0, mode, b_1[0]);
	or(gate_carry_1, f1_0, f2_0, f3_0);

	and(f1_1, a[1], b_1[1]);
	and(f2_1, a[1], gate_carry_1);
	and(f3_1, gate_carry_1, b_1[1]);
	or(gate_carry_2, f1_1, f2_1, f3_1);

	and(f1_2, a[2], b_1[2]);
	and(f2_2, a[2], gate_carry_2);
	and(f3_2, gate_carry_2, b_1[2]);
	or(gate_carry_3, f1_2, f2_2, f3_2);
		
	and(f1_3, a[3], b_1[3]);
	and(f2_3, a[3], gate_carry_3);
	and(f3_3, gate_carry_3, b_1[3]);
	or(gate_carry, f1_3, f2_3, f3_3);
	
	//dataflow
	assign b_2		= b ^ {4{mode}};
	assign data_out[0] 	= a[0] ^ b_2[0] ^ mode;
	assign data_carry_1	= (a[0] & b_2[0]) | (a[0] & mode) | (b_2[0] & mode);

	assign data_out[1] 	= a[1] ^ b_2[1] ^ data_carry_1;
	assign data_carry_2	= (a[1] & b_2[1]) | (a[1] & data_carry_1) | (b_2[1] & data_carry_1);

	assign data_out[2] 	= a[2] ^ b_2[2] ^ data_carry_2;
	assign data_carry_3	= (a[2] & b_2[2]) | (a[2] & data_carry_2) | (b_2[2] & data_carry_2);

	assign data_out[3] 	= a[3] ^ b_2[3] ^ data_carry_3;
	assign data_carry	= (a[3] & b_2[3]) | (a[3] & data_carry_3) | (b_2[3] & data_carry_3);

	//behavioral	
	always @(*) begin
		b_3		= b ^ {4{mode}};
		behav_out[0] 	= a[0] ^ b_3[0] ^ mode;
		behav_carry_1	= (a[0] & b_3[0]) | (a[0] & mode) | (b_3[0] & mode);
	end

	always @(*) begin
		behav_out[1] 	= a[1] ^ b_3[1] ^ behav_carry_1;
		behav_carry_2	= (a[1] & b_3[1]) | (a[1] & behav_carry_1) | (b_3[1] & behav_carry_1);
	end

	always @(*) begin
		behav_out[2] 	= a[2] ^ b_3[2] ^ behav_carry_2;
		behav_carry_3	= (a[2] & b_3[2]) | (a[2] & behav_carry_2) | (b_3[2] & behav_carry_2);
	end

	always @(*) begin
		behav_out[3] 	= a[3] ^ b_3[3] ^ behav_carry_3;
		behav_carry	= (a[3] & b_3[3]) | (a[3] & behav_carry_3) | (b_3[3] & behav_carry_3);
	end

	
endmodule