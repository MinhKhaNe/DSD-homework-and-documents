module universal_shift_register(
	input	wire		clk,
	input	wire		rst_n,
	input	wire	[1:0]	S,
	input	wire		sl_in,
	input	wire		sr_in,
	input	wire	[3:0]	p_din,
	output	reg	[3:0]	p_dout,	
	output	reg		sr_out,
	output	reg		sl_out
);

	always @(posedge clk or negedge rst_n) begin
		if(!rst_n) begin
			p_dout <= 4'b0;
		end
		else begin
			case(S)
				2'b00: begin
				 	p_dout <= p_dout;
				end
				2'b01: begin
					sr_out <= p_dout[0];
				 	p_dout <= {sr_in, p_dout[3:1]};
				end
				2'b10:	begin
					sl_out = p_dout[3];
					p_dout <= {p_dout[2:0], sl_in};
				end
				2'b11: 	begin
					p_dout <= p_din;
				end
			endcase
		end
	end	

endmodule

