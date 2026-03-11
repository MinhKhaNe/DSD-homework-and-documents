module mux_2bit(
	input	wire	[1:0] 	a,
	input	wire	[1:0]	b,
	input	wire 		s,
	output	wire	[1:0]	gate_out,
	output	wire	[1:0]	data_out,
	output	reg	[1:0]	behav_out
);

	wire 	[1:0] 	f1, f2;
	wire		s_or;

	//structural
	not(s_or,s);

	and(f1[0], s_or, b[0]);
	and(f2[0], s, a[0]);
	or(gate_out[0], f1[0], f2[0]);

	and(f1[1], s_or, b[1]);
	and(f2[1], s, a[1]);
	or(gate_out[1], f1[1], f2[1]);

	//dataflow
	assign data_out = s ? a : b;

	//behavioral
	always @(*) begin
		if(s)
			behav_out <= a;
		else
			behav_out <= b;
	end

endmodule