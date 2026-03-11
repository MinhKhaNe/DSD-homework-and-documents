module mux2to1(
	input	wire 	a,
	input	wire	b,
	input	wire 	s,
	output	wire	gate_out,
	output	wire	data_out,
	output	reg	behav_out
);

	wire s_or, f1, f2;

	//structural
	not(s_or,s);
	and(f1, s_or, b);
	and(f2, s, a);
	or(gate_out, f1, f2);

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