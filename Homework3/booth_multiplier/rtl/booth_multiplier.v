module booth_multiplier(
	input	wire	[3:0]	Q,
	input	wire	[3:0]	M,
	output	wire	[7:0]	gate_out,
	output	wire	[7:0]	data_out,
	output	reg	[7:0]	behav_out
);
	reg 		[3:0]	A;
	wire		[10:0]	c;
	wire		[5:0]	s;
	reg		[3:0]	Q_reg;
	wire  		[7:0] 	M_ext;
	genvar 			g;
	integer 		i;
	reg			q_1;
	wire			Q_1;

	wire 		[3:0] 	p0, p1, p2, p3;
	wire 		[7:0] 	pp0, pp1, pp2, pp3;

	and(p0[0], Q[0], M[0]);
	and(p0[1], Q[0], M[1]);
	and(p0[2], Q[0], M[2]);
	and(p0[3], Q[0], M[3]);

	and(p1[0], Q[1], M[0]);
	and(p1[1], Q[1], M[1]);
	and(p1[2], Q[1], M[2]);
	and(p1[3], Q[1], M[3]);

	and(p2[0], Q[2], M[0]);
	and(p2[1], Q[2], M[1]);
	and(p2[2], Q[2], M[2]);
	and(p2[3], Q[2], M[3]);

	and(p3[0], Q[3], M[0]);
	and(p3[1], Q[3], M[1]);
	and(p3[2], Q[3], M[2]);
	and(p3[3], Q[3], M[3]);

	assign gate_out[0] = p0[0];
	
	//row0
	half_adder ha0(
		.a(p0[1]), 
		.b(p1[0]), 
		.sum(gate_out[1]), 
		.carry(c[0])
	);
	half_adder ha1(
		.a(p1[1]), 
		.b(p2[0]), 
		.sum(s[0]), 
		.carry(c[1])
	);
	half_adder ha2(
		.a(p2[1]), 
		.b(p3[0]), 
		.sum(s[1]), 
		.carry(c[2])
	);
		
	//row1
	full_adder fa0(
		.a(p0[2]), 
		.b(c[0]), 
		.cin(s[0]), 
		.sum(gate_out[2]), 
		.carry(c[3])
	);

	full_adder fa1(
		.a(p1[2]), 
		.b(c[1]), 
		.cin(s[1]), 
		.sum(s[2]), 
		.carry(c[4])
	);

    	full_adder fa2(
		.a(p2[2]), 
		.b(c[2]), 
		.cin(p3[1]), 
		.sum(s[3]), 
		.carry(c[5])
	);

	//row2
	full_adder fa3(
		.a(p0[3]),
		.b(c[3]),
		.cin(s[2]),
		.sum(gate_out[3]),
		.carry(c[6])
	);
	full_adder fa4(
		.a(p1[3]),
		.b(c[4]),
		.cin(s[3]),
		.sum(s[4]),
		.carry(c[7])
	);
	full_adder fa5(
		.a(p2[3]),
		.b(c[5]),
		.cin(p3[2]),
		.sum(s[5]),
		.carry(c[8])
	);

	//row3
	half_adder ha3(
		.a(c[6]), 
		.b(s[4]), 
		.sum(gate_out[4]), 
		.carry(c[9])
	);

	full_adder fa6(
		.a(c[9]), 
		.b(c[7]), 
		.cin(s[5]), 
		.sum(gate_out[5]), 
		.carry(c[10])
	);

	full_adder fa7(
		.a(c[10]),
		.b(c[8]), 
		.cin(p3[3]), 
		.sum(gate_out[6]), 
		.carry(gate_out[7])
	);

	//dataflow
	assign M_ext	= 	{{4{M[3]}}, M};
	assign Q_1	= 	1'b0;

	assign pp0 	= 	({Q[0], Q_1} == 2'b01) ? $signed(M_ext << 0) :
                 		({Q[0], Q_1} == 2'b10) ? $signed((~M_ext + 1) << 0) : 
				8'sb0;

   	assign pp1 	= 	({Q[1], Q[0]} == 2'b01) ? $signed(M_ext << 1) :
                 		({Q[1], Q[0]} == 2'b10) ? $signed((~M_ext + 1) << 1) : 
				8'sb0;

    	assign pp2 	= 	({Q[2], Q[1]} == 2'b01) ? $signed(M_ext << 2) :
                 		({Q[2], Q[1]} == 2'b10) ? $signed((~M_ext + 1) << 2) : 
				8'sb0;

    	assign pp3 	= 	({Q[3], Q[2]} == 2'b01) ? $signed(M_ext << 3) :
                 		({Q[3], Q[2]} == 2'b10) ? $signed((~M_ext + 1) << 3) : 
				8'sb0;

	assign data_out = $signed(pp0) + $signed(pp1) + $signed(pp2) + $signed(pp3);

	always @(*) begin
		A = 4'b0;
		Q_reg = Q;
		q_1 = 1'b0;

		for (i = 0; i < 4; i = i + 1) begin
			case ({Q_reg[0], q_1})
				2'b01: 		A = A + M; 
				2'b10: 		A = A - M; 
				default: 	A = A; 
			endcase
			q_1 = Q_reg[0];
    			{A, Q_reg} = {A, Q_reg} >>> 1;
		end
		behav_out = {A, Q_reg};
	end	
endmodule