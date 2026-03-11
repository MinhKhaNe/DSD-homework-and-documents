module  cla_adder_4bit(
	input	wire	[3:0]	a,
	input	wire	[3:0]	b,
	input	wire		cin,
	output	wire	[3:0]	gate_sum,
	output	wire	[3:0]	data_sum,
	output	reg	[3:0]	behav_sum,
	output	wire		gate_carry,
	output	wire		data_carry,
	output	reg		behav_carry
);
	wire	[3:0] 	g, p, c; 	//cout gate model
	wire 	[3:0]	g2, p2, c2; 	//cout dataflow
	reg 	[3:0]	g3, p3, c3;	//cout behavioural model

	//structural
    	assign c[0] = cin;

    	and (g[0], a[0], b[0]);
    	and (g[1], a[1], b[1]);
    	and (g[2], a[2], b[2]);
    	and (g[3], a[3], b[3]);

    	xor (p[0], a[0], b[0]);
    	xor (p[1], a[1], b[1]);
    	xor (p[2], a[2], b[2]);
    	xor (p[3], a[3], b[3]);

    	wire t1_0;
    	and (t1_0, p[0], c[0]);
    	or  (c[1], g[0], t1_0);

    	wire t2_0, t2_1;
    	and (t2_0, p[1], g[0]);
    	and (t2_1, p[1], p[0], c[0]);
    	or  (c[2], g[1], t2_0, t2_1);

    	wire t3_0, t3_1, t3_2;
    	and (t3_0, p[2], g[1]);
    	and (t3_1, p[2], p[1], g[0]);
    	and (t3_2, p[2], p[1], p[0], c[0]);
    	or  (c[3], g[2], t3_0, t3_1, t3_2);

    	wire t4_0, t4_1, t4_2, t4_3;
    	and (t4_0, p[3], g[2]);
    	and (t4_1, p[3], p[2], g[1]);
    	and (t4_2, p[3], p[2], p[1], g[0]);
    	and (t4_3, p[3], p[2], p[1], p[0], c[0]);
    	or  (gate_carry, g[3], t4_0, t4_1, t4_2, t4_3);

    	xor (gate_sum[0], p[0], c[0]);
    	xor (gate_sum[1], p[1], c[1]);
    	xor (gate_sum[2], p[2], c[2]);
    	xor (gate_sum[3], p[3], c[3]);

	//dataflow
	assign g2 		= a & b;
	assign p2 		= a ^ b;

	assign c2[0] 		= cin;
	assign c2[1]		= g2[0] | (p2[0] & c2[0]);
	assign c2[2]		= g2[1] | (p2[1] & g2[0]) | (p2[1] & p2[0] & c2[0]);
	assign c2[3]		= g2[2] | (p2[2] & g2[1]) | (p2[2] & p2[1] & g2[0]) | (p2[2] & p2[1] & p2[0] & c2[0]);
	assign data_carry 	= g2[3] | (p2[3] & g2[2]) | (p2[3] & p2[2] & g2[1]) | (p2[3] & p2[2] & p2[1] & g2[0]) | (p2[3] & p2[2] & p2[1] & p2[0] & c2[0]);
	
	assign data_sum 	= p2 ^ c2[3:0];
	
	//behavioral 	
	always @(*) begin
		g3 		= a & b;
	 	p3 		= a ^ b;

	 	c3[0] 		= cin;
	 	c3[1]		= g3[0] | (p3[0] & c3[0]);
	 	c3[2]		= g3[1] | (p3[1] & g3[0]) | (p3[1] & p3[0] & c3[0]);
	 	c3[3]		= g3[2] | (p3[2] & g3[1]) | (p3[2] & p3[1] & g3[0]) | (p3[2] & p3[1] & p3[0] & c3[0]);
	 	behav_carry 	= g3[3] | (p3[3] & g3[2]) | (p3[3] & p3[2] & g3[1]) | (p3[3] & p3[2] & p3[1] & g3[0]) | (p3[3] & p3[2] & p3[1] & p3[0] & c3[0]);
	
		behav_sum 	= p3 ^ c3[3:0];
	end
endmodule