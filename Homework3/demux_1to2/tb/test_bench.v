module test_bench;

	reg	a, s;
	wire	data_out_0, gate_out_0, behav_out_0;
	wire	data_out_1, gate_out_1, behav_out_1;

	demux_1to2 DUT(.*);

	initial begin
		$dumpfile("wave.vcd");
		$dumpvars(0,test_bench);
		$display("===== Test DEMUX 1 to 2 =====");
		$display("====== A = 0, S = 0  =======");
		a = 0; s = 0;
		#1;
		if(data_out_0 != a || gate_out_0 != a || behav_out_0 != a) begin
			$display("===== t=%d FAILED, output does not match =====",$time);
			$display("===== t=%d Expected value is %b, Actual gate value is %b, Actual data value is %b, Actual behavioral value is %b =====",$time, gate_out_0, data_out_0, behav_out_0);
		end
		else begin
			$display("===== t=%d PASSED SUCCESSFULLY =====",$time);
		end
		
		$display("====== A = 1, S = 0 =======");
		a = 1; s = 0;
		#1;
		if(data_out_0 != a || gate_out_0 != a || behav_out_0 != a) begin
			$display("===== t=%d FAILED, output does not match =====",$time);
			$display("===== t=%d Expected value is %b, Actual gate value is %b, Actual data value is %b, Actual behavioral value is %b =====",$time, a, gate_out_0, data_out_0, behav_out_0);
		end
		else begin
			$display("===== t=%d PASSED SUCCESSFULLY =====",$time);
		end

		$display("====== A = 0, S = 1  =======");
		a = 0; s = 0;
		#1;
		if(data_out_1 != a || gate_out_1 != a || behav_out_1 != a) begin
			$display("===== t=%d FAILED, output does not match =====",$time);
			$display("===== t=%d Expected value is %b, Actual gate value is %b, Actual data value is %b, Actual behavioral value is %b =====",$time, gate_out_1, data_out_1, behav_out_1);
		end
		else begin
			$display("===== t=%d PASSED SUCCESSFULLY =====",$time);
		end
		
		$display("====== A = 1, S = 1 =======");
		a = 1; s = 1;
		#1;
		if(data_out_1 != a || gate_out_1 != a || behav_out_1 != a) begin
			$display("===== t=%d FAILED, output does not match =====",$time);
			$display("===== t=%d Expected value is %b, Actual gate value is %b, Actual data value is %b, Actual behavioral value is %b =====",$time, a, gate_out_1, data_out_1, behav_out_1);
		end
		else begin
			$display("===== t=%d PASSED SUCCESSFULLY =====",$time);
		end
		#1;
		$finish;
	end

endmodule