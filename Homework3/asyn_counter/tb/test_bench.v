module test_bench;

	reg		clk, rst_n;
	wire	[3:0]	Q;
	integer		i;
	reg	[3:0]	a;

	asyn_counter DUT(.*);

	initial begin
		clk = 0;
		forever #25 clk = ~clk;
	end

	initial begin
		$dumpfile("wave.vcd");
		$dumpvars(0,test_bench);
		$display("===== Asynchronous Counter Testbench =====");
		$monitor("===== With Reset value = %b =====", rst_n);
		rst_n = 0;
		@(posedge clk); 
		#1;
		if(Q!=0) begin
			$display("===== t=%d FAILED, output does not match =====",$time);
			$display("===== t=%d Expected value is %b, Actual value is %b =====",$time, 0, Q);
		end
		else begin
			$display("===== t=%d PASSED SUCCESSFULLY =====",$time);
		end

		rst_n = 1; a = 4'b1111;
		for(i = 0; i < 16; i = i + 1) begin
				@(posedge clk);
				#1;
				if(Q!=a) begin
					$display("===== t=%d FAILED, output does not match =====",$time);
					$display("===== t=%d Expected value is %b, Actual value is %b =====",$time, a, Q);
				end
				else begin
					$display("===== t=%d PASSED SUCCESSFULLY =====",$time);
				end
				a = a - 4'b0001;
		end
		#10;
		$finish;
	end
	
endmodule