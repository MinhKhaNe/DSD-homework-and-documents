module adder_4bit(
	input	wire	[3:0] 	a,
	input	wire	[3:0] 	b,
	input	wire	 	cin,
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
	
	//structural
	xor(gate_out[0], a[0], b[0], cin);
	xor(gate_out[1], a[1], b[1], gate_carry_1);
	xor(gate_out[2], a[2], b[2], gate_carry_2);
	xor(gate_out[3], a[3], b[3], gate_carry_3);

	and(f1_0,a[0],b[0]);
	and(f2_0,a[0],cin);
	and(f3_0,cin,b[0]);
	or(gate_carry_1, f1_0, f2_0, f3_0);

	and(f1_1,a[1],b[1]);
	and(f2_1,a[1],gate_carry_1);
	and(f3_1,gate_carry_1,b[1]);
	or(gate_carry_2, f1_1, f2_1, f3_1);

	and(f1_2,a[2],b[2]);
	and(f2_2,a[2],gate_carry_2);
	and(f3_2,gate_carry_2,b[2]);
	or(gate_carry_3, f1_2, f2_2, f3_2);
		
	and(f1_3,a[3],b[3]);
	and(f2_3,a[3],gate_carry_3);
	and(f3_3,gate_carry_3,b[3]);
	or(gate_carry, f1_3, f2_3, f3_3);
	
	//dataflow
	assign data_out[0] 	= a[0] ^ b[0] ^ cin;
	assign data_carry_1	= (a[0] & b[0]) | (a[0] & cin) | (b[0] & cin);

	assign data_out[1] 	= a[1] ^ b[1] ^ data_carry_1;
	assign data_carry_2	= (a[1] & b[1]) | (a[1] & data_carry_1) | (b[1] & data_carry_1);

	assign data_out[2] 	= a[2] ^ b[2] ^ data_carry_2;
	assign data_carry_3	= (a[2] & b[2]) | (a[2] & data_carry_2) | (b[2] & data_carry_2);

	assign data_out[3] 	= a[3] ^ b[3] ^ data_carry_3;
	assign data_carry	= (a[3] & b[3]) | (a[3] & data_carry_3) | (b[3] & data_carry_3);

	//behavioral	
	always @(*) begin
		behav_out[0] 	= a[0] ^ b[0] ^ cin;
		behav_carry_1	= (a[0] & b[0]) | (a[0] & cin) | (b[0] & cin);
	end

	always @(*) begin
		behav_out[1] 	= a[1] ^ b[1] ^ behav_carry_1;
		behav_carry_2	= (a[1] & b[1]) | (a[1] & data_carry_1) | (b[1] & behav_carry_1);
	end

	always @(*) begin
		behav_out[2] 	= a[2] ^ b[2] ^ behav_carry_2;
		behav_carry_3	= (a[2] & b[2]) | (a[2] & data_carry_2) | (b[2] & behav_carry_2);
	end

	always @(*) begin
		behav_out[3] 	= a[3] ^ b[3] ^ behav_carry_3;
		behav_carry	= (a[3] & b[3]) | (a[3] & data_carry_3) | (b[3] & behav_carry_3);
	end

endmodule