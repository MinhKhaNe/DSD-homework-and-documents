module mealy_detector(
	input	wire	clk,
	input	wire	rst_n,
	input	wire	in,
	output	reg	out
);

	parameter	A = 4'h0;
	parameter	B = 4'h4;
	parameter	C = 4'h8;
	parameter	D = 4'hC;

	reg	[3:0]	state, current_state;

	always @(posedge clk or negedge rst_n) begin
		if(!rst_n)
			current_state	<= A;
		else
			current_state	<= state;
	end

	always @(*) begin
		state 	= current_state;
		out	= 0;
		case(current_state)
			A: begin
				if(in == 1)
					state 	= B;
				else
					state	= A;
			end
			B: begin
				if(in == 0)
					state 	= C;
				else
					state	= B;
			end
			C: begin
				if(in == 1)
					state 	= D;
				else
					state	= A;
			end
			D: begin
				if(in == 0) begin
					state 	= C;
					out	= 1;
				end
				else begin
					state	= B;
				end
			end
			default: begin
				state	= A;
			end
		endcase
	end
		
endmodule