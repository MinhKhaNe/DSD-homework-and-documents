module demux_1to2(
	input	wire 	a,
	input	wire 	s,
	output	wire	gate_out_0,
	output	wire	gate_out_1,
	output	wire	data_out_0,
	output	wire	data_out_1,
	output	reg	behav_out_0,
	output	reg	behav_out_1
);

	wire s_or, f1, f2, f3, f4;

	//structural
	not(s_or, s);

	and(gate_out_0, s_or, a); 
	and(gate_out_1, s, a);    

	//dataflow
	assign data_out_0 = s ? 1'b0 : a;
	assign data_out_1 = s ? a : 1'b0;

	//behavioral
	always @(*) begin
		behav_out_1 <= 1'b0;
		behav_out_0 <= 1'b0;
		if(s)
			behav_out_1 <= a;
		else
			behav_out_0 <= a;
	end

endmodule