module parity_generator(
	input	wire	[3:0]	a,
	output	wire	[4:0]	gate_out,
	output	wire		gate_parity,
	output	wire	[4:0]	data_out,
	output	wire		data_parity,
	output	reg	[4:0]	behav_out,
	output	reg		behav_parity
);

	integer	i, sum;
	wire	gate_parity_1;

	// -----------------
	// Structural parity (XOR chain)
	xor(gate_parity_1, a[0], a[1], a[2], a[3]);
	not(gate_parity, gate_parity_1);

	buf(gate_out[4], a[3]);
	buf(gate_out[3], a[2]);
	buf(gate_out[2], a[1]);
	buf(gate_out[1], a[0]);
	buf(gate_out[0], gate_parity);


	// Dataflow style
	assign data_parity	= ~(a[0] ^ a[1] ^ a[2] ^ a[3]);
	assign data_out		= {a, data_parity};

	// Behavioural style
	always @(*) begin
		sum = 0;
		for(i=0; i<4; i=i+1) begin
			sum = sum + a[i];
		end
		behav_parity = (sum % 2) == 0 ? 1 : 0;
		behav_out = {a, behav_parity};
	end

endmodule
