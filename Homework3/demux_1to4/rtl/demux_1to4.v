module demux_1to4(
	input	wire 		a,
	input	wire	[1:0] 	s,
	output	wire		gate_out_0,
	output	wire		gate_out_1,
	output	wire		gate_out_2,
	output	wire		gate_out_3,
	output	wire		data_out_0,
	output	wire		data_out_1,
	output	wire		data_out_2,
	output	wire		data_out_3,
	output	reg		behav_out_0,
	output	reg		behav_out_1,
	output	reg		behav_out_2,
	output	reg		behav_out_3

);

	wire s0_or, s1_or;

	//structural
	not(s0_or, s[0]);
	not(s1_or, s[1]);

	and(gate_out_0, s1_or, s0_or, a); 
	and(gate_out_1, s1_or, s[0], a);    
	and(gate_out_2, s[1], s0_or, a); 
	and(gate_out_3, s[1], s[0], a);

	//dataflow
	assign data_out_0 = s == 2'b00 ? a : 1'b0;
	assign data_out_1 = s == 2'b01 ? a : 1'b0;
	assign data_out_2 = s == 2'b10 ? a : 1'b0;
	assign data_out_3 = s == 2'b11 ? a : 1'b0;

	//behavioral
	always @(*) begin
		behav_out_1 <= 1'b0;
		behav_out_0 <= 1'b0;
		behav_out_2 <= 1'b0;
		behav_out_3 <= 1'b0;
		case(s)
			2'b00: 	behav_out_0 <= a;
			2'b01:	behav_out_1 <= a;
			2'b10:	behav_out_2 <= a;
			2'b11:	behav_out_3 <= a;
		endcase
	end

endmodule