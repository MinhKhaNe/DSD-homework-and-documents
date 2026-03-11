module decoder_3to8(
	input	wire	[2:0] 	s,
	output	wire	[7:0]	gate_out,
	output	wire	[7:0]	data_out,
	output	reg	[7:0]	behav_out
);
	wire	n0, n1, n2;

	//structural
	not(n0, s[0]);
	not(n1, s[1]);
	not(n2, s[2]);

	and(gate_out[0], n2, n1, n0);
	and(gate_out[1], n2, n1, s[0]);
	and(gate_out[2], n2, s[1], n0);
	and(gate_out[3], n2, s[1], s[0]);

	and(gate_out[4], s[2], n1, n0);
	and(gate_out[5], s[2], n1, s[0]);
	and(gate_out[6], s[2], s[1], n0);
	and(gate_out[7], s[2], s[1], s[0]);

	//dataflow
	assign data_out = (8'b0000_0001 << s);

	//behavioural
	always @(*) begin
		case(s)
				3'b000:		behav_out = 8'b0000_0001;
				3'b001:		behav_out = 8'b0000_0010;
				3'b010:		behav_out = 8'b0000_0100;
				3'b011:		behav_out = 8'b0000_1000;
				3'b100:		behav_out = 8'b0001_0000;
				3'b101:		behav_out = 8'b0010_0000;
				3'b110:		behav_out = 8'b0100_0000;
				3'b111:		behav_out = 8'b1000_0000;
				default:	behav_out = 8'b0;
		endcase
	end

endmodule