module test_bench1;

	reg	a, b;
	wire 	gate_out, data_out, behav_out;

	and_gate DUT(.*);

	initial begin
		$dumpfile("wave1.vcd");
		$dumpvars(0,test_bench1);
		$display("===== And Gate Testbench =====");
		$monitor("===== t=%d A = %b, B = %b, Gate Level Output = %b, Dataflow Output = %b, Behavioral Output = %b =====",$time, a, b, gate_out, data_out, behav_out);
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