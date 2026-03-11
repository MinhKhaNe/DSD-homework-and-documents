module test_bench1;

	reg 	A, B, C;
	wire	F;	

	first_module DUT(.*);

	initial begin
		$dumpfile("wave1.vcd");     
        	$dumpvars(0, test_bench1);
		$monitor("===== t=%d  A = %b, B = %b, C = %b, F = %b =====", $time, A, B, C, F);
		A = 0; B = 0; C = 0;
		#1;
		A = 0; B = 0; C = 1;
		#1;
		A = 0; B = 1; C = 0;
		#1;
		A = 0; B = 1; C = 1;
		#1;
		A = 1; B = 0; C = 0;
		#1;
		A = 1; B = 0; C = 1;
		#1;
		A = 1; B = 1; C = 0;
		#1;
		A = 1; B = 1; C = 1;
		#1;
		$finish;
	end

endmodule