module test_bench;

	reg	clk, rst_n, in;
	wire	out;

	moore_detector DUT(.*);

	initial begin
		clk = 0;
		forever #25 clk = ~clk;
	end

	initial begin
		$dumpfile("wave.vcd");
		$dumpvars(0,test_bench);
		$display("===== Test Moore Sequence Detector =====");
		$monitor("===== With Input Value = %b =====",in);
		rst_n = 0; in = 0;
		$display("===== With Reset value = %b =====", rst_n);
		@(posedge clk);
		#1;
		check_result(1'b0, out);

		rst_n = 1;
		$display("===== With Reset value = %b =====", rst_n);
		in = 1;
		@(posedge clk);
		#1;
		check_result(1'b0, out);

		in = 0;
		@(posedge clk);
		#1;
		check_result(1'b0, out);

		in = 1;
		@(posedge clk);
		#1;
		check_result(1'b0, out);

		in = 0;
		@(posedge clk);
		#1;
		check_result(1'b1, out);

		in = 0;
		@(posedge clk);
		#1;
		check_result(1'b0, out);

		in = 1;
		@(posedge clk);
		#1;
		check_result(1'b0, out);

		in = 0;
		@(posedge clk);
		#1;
		check_result(1'b0, out);

		in = 0;
		@(posedge clk);
		#1;
		check_result(1'b0, out);

		in = 1;
		@(posedge clk);
		#1;
		check_result(1'b0, out);

		in = 0;
		@(posedge clk);
		#1;
		check_result(1'b0, out);

		in = 1;
		@(posedge clk);
		#1;
		check_result(1'b0, out);

		in = 0;
		@(posedge clk);
		#1;
		check_result(1'b1, out);

		#10;
		$finish;
	end

	task check_result;
		input		result;
		input		g;

		if(g!=result) begin
			$display("\n===== t=%d FAILED, output does not match =====",$time);
			$display("===== t=%d Expected value is %b, Actual value is %b =====",$time, result, g);
		end
		else begin
			$display("\n===== t=%d PASSED SUCCESSFULLY =====",$time);
		end
	endtask
	
endmodule