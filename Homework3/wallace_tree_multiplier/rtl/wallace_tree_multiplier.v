module wallace_tree_multiplier(
	input	wire	[3:0]	a,
	input	wire	[3:0]	b,
	output	wire	[7:0]	gate_out,
	output	wire	[7:0]	data_out,
	output	reg	[7:0]	behav_out
);
	wire	[3:0]	d0, d1, d2, d3;
	reg	[3:0]	b0, b1, b2, b3;
	wire	[3:0]	g0, g1, g2, g3;
	wire	[6:0]	carry_row, sum_row;
	wire		c_final;
	wire		s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, s16, s17, s21;
	wire		c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15, c16, c17, c21;

	//structural
	and(g0[0], a[0], b[0]);
	and(g0[1], a[1], b[0]);
	and(g0[2], a[2], b[0]);
	and(g0[3], a[3], b[0]);

	and(g1[0], a[0], b[1]);
	and(g1[1], a[1], b[1]);
	and(g1[2], a[2], b[1]);
	and(g1[3], a[3], b[1]);

	and(g2[0], a[0], b[2]);
	and(g2[1], a[1], b[2]);
	and(g2[2], a[2], b[2]);
	and(g2[3], a[3], b[2]);

	and(g3[0], a[0], b[3]);
	and(g3[1], a[1], b[3]);
	and(g3[2], a[2], b[3]);
	and(g3[3], a[3], b[3]);
	
	half_adder ha1_1(.a(g0[1]), .b(g1[0]), .sum(gate_out[1]), .carry(c11));
	
	half_adder ha2_1(.a(g0[2]), .b(g1[1]), .sum(s0), .carry(c0));
	full_adder fa2_2(.a(s0), .b(c11), .cin(g2[0]), .sum(gate_out[2]), .carry(c12));

	full_adder fa3_1(.a(g0[3]), .b(g1[2]), .cin(g2[1]), .sum(s1), .carry(c1));
	half_adder ha3_1(.a(s1), .b(g3[0]), .sum(s6), .carry(c6));
	full_adder fa3_2(.a(s6), .b(c0), .cin(c12), .sum(gate_out[3]), .carry(c13));

	full_adder fa4_1(.a(g3[1]), .b(g1[3]), .cin(g2[2]), .sum(s2), .carry(c2));
	full_adder fa4_2(.a(s2), .b(1'b0), .cin(c1), .sum(s7), .carry(c7));
	full_adder fa4_3(.a(s7), .b(c13), .cin(c6), .sum(gate_out[4]), .carry(c14));

	full_adder fa5_1(.a(g3[2]), .b(1'b0), .cin(g2[3]), .sum(s3), .carry(c3));
	full_adder fa5_2(.a(s3), .b(1'b0), .cin(c2), .sum(s8), .carry(c8));
	full_adder fa5_3(.a(s8), .b(c14), .cin(c7), .sum(gate_out[5]), .carry(c15));

	full_adder fa6_1(.a(g3[3]), .b(1'b0), .cin(1'b0), .sum(s4), .carry(c4));
	full_adder fa6_2(.a(s4), .b(1'b0), .cin(c3), .sum(s9), .carry(c9));
	full_adder fa6_3(.a(s9), .b(c15), .cin(c8), .sum(gate_out[6]), .carry(c16));

	full_adder fa7_1(.a(1'b0), .b(1'b0), .cin(1'b0), .sum(s5), .carry(c21));
	full_adder fa7_2(.a(s5), .b(1'b0), .cin(c4), .sum(s10), .carry(c10));
	full_adder fa7_3(.a(s10), .b(c16), .cin(c9), .sum(gate_out[7]), .carry(c17));	
    
	buf(gate_out[0], g0[0]);  

	//dataflow
	assign d0 = a & {4{b[0]}};
	assign d1 = a & {4{b[1]}};
	assign d2 = a & {4{b[2]}};
	assign d3 = a & {4{b[3]}};

	assign data_out = (d0 << 0) + (d1 << 1) + (d2 << 2) + (d3 << 3);

	//behavioral
	always @(*) begin
		b0 = a & {4{b[0]}};
		b1 = a & {4{b[1]}};
		b2 = a & {4{b[2]}};
		b3 = a & {4{b[3]}};
		behav_out = (b0 << 0) + (b1 << 1) + (b2 << 2) + (b3 << 3);
	end
	
endmodule