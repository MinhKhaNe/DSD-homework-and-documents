module full_adder(
	input	wire	a,
	input 	wire	b,
	input 	wire	cin,
	output	wire	gate_sum,
	output	wire	data_sum,
	output	reg	behav_sum,
	output	wire	gate_carry,
	output	wire	data_carry,
	output	reg	behav_carry
);

	wire data_carry_1, data_carry_2, data_sum_1;	
	wire gate_carry_1, gate_carry_2, gate_sum_1;
	reg behav_carry_1, behav_carry_2, behav_sum_1;
	
	//structural
	//half_adder_1
	xor(gate_sum_1, a, b);
	and(gate_carry_1, a, b);

	//half_adder_2
	and(gate_carry_2, gate_sum_1, cin);

	//full_adder
	xor(gate_sum, gate_sum_1, cin);
	or(gate_carry, gate_carry_1, gate_carry_2);
	
	//dataflow
	//half_adder_1
	assign data_sum_1 = a ^ b;
	assign data_carry_1 = a & b;

	//half_adder_2
	assign data_carry_2 = data_sum_1 & cin;

	//full_adder
	assign data_sum = data_sum_1 ^ cin;
	assign data_carry = data_carry_1 | data_carry_2;

	//combinational
	//half_adder_1
	always @(*) begin
		behav_carry_1 = a & b;
		behav_sum_1 = a ^ b;
	end

	//half_adder_2
	always @(*) begin
		behav_carry_2 = behav_sum_1 & cin;
	end

	//full_adder
	always @(*) begin
		behav_carry = behav_carry_2 | behav_carry_1;
		behav_sum = behav_sum_1 ^ cin;
	end

endmodule