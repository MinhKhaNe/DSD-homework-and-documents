module alu_2bit(
	input	wire	[1:0]	a,
	input	wire	[1:0]	b,
	input	wire	[1:0]	SL,
	output	wire	[1:0]	data_out,
	output	reg	[1:0]	behav_out,
	output 	wire         	data_carry,
	output 	reg         	behav_carry
);
	wire	[1:0]	add_result;
	wire 	[2:0] 	sum;
	//structural
	

	//dataflow
	assign sum[0] = a[0] ^ b[0];
	assign carry0  = a[0] & b[0];

	assign sum[1] = a[1] ^ b[1] ^ carry0;
	assign carry1 = (a[1] & b[1]) | (a[1] & carry0) | (b[1] & carry0);

	assign sum[2] = carry1;

	assign add_result = sum[1:0];
	assign add_carry  = sum[2];

	
	assign	data_out =	(SL == 2'b00) ? (a & b) :
				(SL == 2'b01) ? (a | b) :
				(SL == 2'b10) ? (add_result) :
				2'b00;

	assign data_carry = 	(SL == 2'b10) ? add_carry : 1'b0;

	//behavioural
	always @(*) begin
		case(SL)
			2'b00: begin
				behav_out = a & b;
				behav_carry = 1'b0;
			end
			2'b01: begin
				behav_out = a | b;
				behav_carry = 1'b0;
			end
			2'b10: begin
				{behav_carry, behav_out} = a + b;
			end
			default: begin
				behav_out 	= 2'b00;
				behav_carry 	= 1'b0;	
			end
		endcase
	end

endmodule