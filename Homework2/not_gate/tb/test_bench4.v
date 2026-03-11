module test_bench4;

	reg	a, b;
	wire 	gate_out_a, data_out_a, behav_out_a;
	wire 	gate_out_b, data_out_b, behav_out_b;

	not_gate DUT(.*);

	initial begin
		$dumpfile("wave4.vcd");
		$dumpvars(0,test_bench4);
		$display("===== NOT Gate Testbench =====");
		$monitor("t=%0d | A=%b -> Gate=%b Dataflow=%b behavioral=%b | B=%b -> Gate=%b Dataflow=%b Behavioral=%b", $time, a, gate_out_a, data_out_a, behav_out_a, b, gate_out_b, data_out_b, behav_out_b);

		$display("===== A = 0, B = 0 =====");
		a = 0; b = 0;
		#1;
		$display("===== A = 0, B = 1 =====");
		a = 0; b = 1;
		#1;
		$display("===== A = 1, B = 0 =====");
		a = 1; b = 0;
		#1;
		$display("===== A = 1, B = 1 =====");
		a = 1; b = 1;
		#1;
		$finish;
	end
	
endmodule