module test_bench9;

	reg	[1:0]	a, b;
	wire		e, g_a, l_a;

	comparator DUT(.*);

	initial begin
		$dumpfile("wave.vcd");
		$dumpvars(0,test_bench9);
		$display("===== Test Comparator =====");
		$display("===== A = 2'b00, B = 2'b00 =====");
		a = 2'b00; b = 2'b00;
		#1;
		if(e != 1) begin
			$display("===== t=%d FAILED, output does not match ======",$time);
			$display("===== t=%d Expected value is %b, Actual value is %b =====", $time, 1, e);
		end
		else begin
			$display("===== t=%d PASSED SUCCESSFULLY =====",$time);
		end
		
		$display("===== A = 2'b01, B = 2'b00 =====");
		a = 2'b01; b = 2'b00;
		#1;
		if(g_a != 1) begin
			$display("===== t=%d FAILED, output does not match ======",$time);
			$display("===== t=%d Expected value is %b, Actual value is %b =====", $time, 1, g_a);
		end
		else begin
			$display("===== t=%d PASSED SUCCESSFULLY =====",$time);
		end

		$display("===== A = 2'b00, B = 2'b01 =====");
		a = 2'b00; b = 2'b01;
		#1;
		if(l_a != 1) begin
			$display("===== t=%d FAILED, output does not match ======",$time);
			$display("===== t=%d Expected value is %b, Actual value is %b =====", $time, 1, l_a);
		end
		else begin
			$display("===== t=%d PASSED SUCCESSFULLY =====",$time);
		end

		$display("===== A = 2'b01, B = 2'b01 =====");
		a = 2'b01; b = 2'b01;
		#1;
		if(e != 1) begin
			$display("===== t=%d FAILED, output does not match ======",$time);
			$display("===== t=%d Expected value is %b, Actual value is %b =====", $time, 1, e);
		end
		else begin
			$display("===== t=%d PASSED SUCCESSFULLY =====",$time);
		end

		$display("===== A = 2'b10, B = 2'b01 =====");
		a = 2'b10; b = 2'b01;
		#1;
		if(g_a != 1) begin
			$display("===== t=%d FAILED, output does not match ======",$time);
			$display("===== t=%d Expected value is %b, Actual value is %b =====", $time, 1, g_a);
		end
		else begin
			$display("===== t=%d PASSED SUCCESSFULLY =====",$time);
		end

		$display("===== A = 2'b01, B = 2'b10 =====");
		a = 2'b01; b = 2'b10;
		#1;
		if(l_a != 1) begin
			$display("===== t=%d FAILED, output does not match ======",$time);
			$display("===== t=%d Expected value is %b, Actual value is %b =====", $time, 1, l_a);
		end
		else begin
			$display("===== t=%d PASSED SUCCESSFULLY =====",$time);
		end

		$display("===== A = 2'b10, B = 2'b10 =====");
		a = 2'b10; b = 2'b10;
		#1;
		if(e != 1) begin
			$display("===== t=%d FAILED, output does not match ======",$time);
			$display("===== t=%d Expected value is %b, Actual value is %b =====", $time, 1, e);
		end
		else begin
			$display("===== t=%d PASSED SUCCESSFULLY =====",$time);
		end

		$display("===== A = 2'b11, B = 2'b10 =====");
		a = 2'b11; b = 2'b10;
		#1;
		if(g_a != 1) begin
			$display("===== t=%d FAILED, output does not match ======",$time);
			$display("===== t=%d Expected value is %b, Actual value is %b =====", $time, 1, g_a);
		end
		else begin
			$display("===== t=%d PASSED SUCCESSFULLY =====",$time);
		end

		$display("===== A = 2'b10, B = 2'b11 =====");
		a = 2'b10; b = 2'b11;
		#1;
		if(l_a != 1) begin
			$display("===== t=%d FAILED, output does not match ======",$time);
			$display("===== t=%d Expected value is %b, Actual value is %b =====", $time, 1, l_a);
		end
		else begin
			$display("===== t=%d PASSED SUCCESSFULLY =====",$time);
		end

		$display("===== A = 2'b11, B = 2'b11 =====");
		a = 2'b11; b = 2'b11;
		#1;
		if(e != 1) begin
			$display("===== t=%d FAILED, output does not match ======",$time);
			$display("===== t=%d Expected value is %b, Actual value is %b =====", $time, 1, e);
		end
		else begin
			$display("===== t=%d PASSED SUCCESSFULLY =====",$time);
		end

		$display("===== A = 2'b11, B = 2'b01 =====");
		a = 2'b11; b = 2'b01;
		#1;
		if(g_a != 1) begin
			$display("===== t=%d FAILED, output does not match ======",$time);
			$display("===== t=%d Expected value is %b, Actual value is %b =====", $time, 1, g_a);
		end
		else begin
			$display("===== t=%d PASSED SUCCESSFULLY =====",$time);
		end
	end
endmodule