module mux3to1(
	input	wire 	[1:0]	S,
	input 	wire		I0,
	input 	wire		I1,
	input 	wire		I2,
	output	wire		gate_out,
	output	wire		data_out,
	output	reg		behav_out
);

	wire S0, S1;
	wire not_S0, not_S1;
	
	assign S0 = S[1];
	assign S1 = S[0];

	//structural
	not(not_S0, S0);
	not(not_S1, S1);
	
	and(f0, not_S0, not_S1, I0);
	and(f1, not_S0, S1, I1);
	and(f2, S0, not_S1, I2);
	or(gate_out, f0, f1, f2);

	//dataflow
	assign data_out = (S == 2'b00) ? I0 : 
			  (S == 2'b01) ? I1 : 
			  (S == 2'b10) ? I2 : 
			  	      	 1'b0 ;

	//behavioral
	always @(*) begin
		case(S)
			2'b00:		behav_out = I0;
			2'b01:		behav_out = I1;
			2'b10:		behav_out = I2;
			default: 	behav_out = 1'b0;
		endcase
	end

endmodule