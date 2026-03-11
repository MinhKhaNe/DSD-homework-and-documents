module decoder_2to4(
	input	wire	[1:0] 	s,
	output	wire	[3:0]	gate_out,
	output	wire	[3:0]	data_out,
	output	reg	[3:0]	behav_out
);
	wire	n0, n1;

	//structural
	not(n0, s[0]);
	not(n1, s[1]);

	and(gate_out[0], n1, n0);
	and(gate_out[1], n1, s[0]);
	and(gate_out[2], s[1], n0);
	and(gate_out[3], s[1], s[0]);

	//dataflow
	assign data_out = (4'b0001 << s);

	//behavioural
	always @(*) begin
		case(s)
			2'b00:		behav_out = 4'b0001;
			2'b01:		behav_out = 4'b0010;
			2'b10:		behav_out = 4'b0100;
			2'b11:		behav_out = 4'b1000;
			default:	behav_out = 4'b0000;
		endcase
	end

endmodule