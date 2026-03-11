module moore_detector(
	input	wire	clk,
	input	wire	rst_n,
	input	wire	in,
	output	reg	out
);

	parameter	A = 4'h0;
	parameter	B = 4'h4;
	parameter	C = 4'h8;
	parameter	D = 4'hC;
	parameter	E = 4'hF;

	reg	[3:0]	state, current_state;

	always @(posedge clk or negedge rst_n) begin
		if(!rst_n)
			current_state	<= A;
		else
			current_state	<= state;
	end

	always @(posedge clk or negedge rst_n) begin
		if(!rst_n) begin
						out	<= 0;
		end
		else begin
			case(current_state)
				E: 		out	<= 1;
				default: 	out 	<= 0;
			endcase
		end
	end

	always @(*) begin
		case(current_state)
			A: begin
				if(in == 1)
					state 	= B;
				else
					state	= A;
			end
			B: begin
				if(in == 1)
					state 	= C;
				else
					state	= A;
			end
			C: begin
				if(in == 1)
					state 	= D;
				else
					state	= A;
			end
			D: begin
				if(in == 0) begin
					state 	= E;
				end
				else begin
					state	= D;
				end
			end
			E: begin
				if(in == 1) begin
					state 	= B;
				end
				else begin
					state	= A;
				end
			end
			default: begin
				state	= A;
			end
		endcase
	end
		
endmodule