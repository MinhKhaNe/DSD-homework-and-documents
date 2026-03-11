module not_gate(
	input	wire	a,
	input 	wire	b,
	output	wire	gate_out_a,
	output	wire	data_out_a,
	output	reg	behav_out_a,
	output	wire	gate_out_b,
	output	wire	data_out_b,
	output	reg	behav_out_b
);
	
	not(gate_out_a, a);
	not(gate_out_b, b);

	assign data_out_a = ~a;
	assign data_out_b = ~b;

	always @(*) begin
		behav_out_a = ~a;
	end
	always @(*) begin
		behav_out_b = ~b;
	end

endmodule