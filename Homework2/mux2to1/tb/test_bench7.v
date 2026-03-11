module test_bench7;

	reg	a, b, s;
	wire	data_out, gate_out, behav_out;

	mux2to1 DUT(.*);

	initial begin
		$dumpfile("wave7.vcd");
		$dumpvars(0,test_bench7);
		$display("===== Test MUX 2 to 1 =====");
		$display("====== A = 1, B = 0, S = 0  =======");
		a = 1; b = 0; s = 0;
		#1;
		if(data_out != b || gate_out != b || behav_out != b) begin
			$display("===== t=%d FAILED, output does not match =====",$time);
			$display("===== t=%d Expected value is %b, Actual gate value is %b, Actual data value is %b, Actual behavioral value is %b =====",$time, b, data_out, gate_out, behav_out);
		end
		else begin
			$display("===== t=%d PASSED SUCCESSFULLY =====",$time);
		end
		
		$display("====== A = 1, B = 0, S = 1  =======");
		a = 1; b = 0; s = 1;
		#1;
		if(data_out != a || gate_out != a || behav_out != a) begin
			$display("===== t=%d FAILED, output does not match =====",$time);
			$display("===== t=%d Expected value is %b, Actual gate value is %b, Actual data value is %b, Actual behavioral value is %b =====",$time, a, data_out, gate_out, behav_out);
		end
		else begin
			$display("===== t=%d PASSED SUCCESSFULLY =====",$time);
		end

		$display("====== A = 0, B = 1, S = 0  =======");
		a = 0; b = 1; s = 0;
		#1;
		if(data_out != b || gate_out != b || behav_out != b) begin
			$display("===== t=%d FAILED, output does not match =====",$time);
			$display("===== t=%d Expected value is %b, Actual gate value is %b, Actual data value is %b, Actual behavioral value is %b =====",$time, b, data_out, gate_out, behav_out);
		end
		else begin
			$display("===== t=%d PASSED SUCCESSFULLY =====",$time);
		end

		$display("====== A = 0, B = 1, S = 1  =======");
		a = 0; b = 1; s = 1;
		#1;
		if(data_out != a || gate_out != a || behav_out != a) begin
			$display("===== t=%d FAILED, output does not match =====",$time);
			$display("===== t=%d Expected value is %b, Actual gate value is %b, Actual data value is %b, Actual behavioral value is %b =====",$time, a, data_out, gate_out, behav_out);
		end
		else begin
			$display("===== t=%d PASSED SUCCESSFULLY =====",$time);
		end
		#1;
		$finish;
	end

endmodule