module binary_encoder(
	input	wire 	I0,
	input	wire	I1,
	input	wire 	I2,
	input	wire	I3,
	output	wire	[1:0]	gate_out,
	output	wire	[1:0]	data_out,
	output	reg	[1:0]	behav_out
);
	
	//structural
	or(gate_out[0], I1, I3);
	or(gate_out[1], I2, I3);

	//dataflow
	assign data_out = I3 ? 2'b11 :
			  I2 ? 2'b10 :
			  I1 ? 2'b01 :
			  I0 ? 2'b00 :
				2'b00;

	//behavioral
	always @(*) begin
		if(I3)
			behav_out <= 2'b11;
		else if(I2)
			behav_out <= 2'b10;
		else if(I1)
			behav_out <= 2'b01;
		else if(I0)
			behav_out <= 2'b00;
		else 
			behav_out <= 2'b00;
	end

endmodule