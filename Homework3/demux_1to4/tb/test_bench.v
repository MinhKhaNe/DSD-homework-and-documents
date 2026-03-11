module test_bench;

	reg	a;
	reg	[1:0]	s;
	wire	data_out_0, gate_out_0, behav_out_0;
	wire	data_out_1, gate_out_1, behav_out_1;
	wire	data_out_2, gate_out_2, behav_out_2;
	wire	data_out_3, gate_out_3, behav_out_3;

	demux_1to4 DUT(.*);

	initial begin
		$dumpfile("wave.vcd");
		$dumpvars(0,test_bench);
		$display("===== Test DEMUX 1 to 4 =====");
		$display("====== A = 0, S = 2'b00  =======");
		a = 1; s = 2'b00;
		#1;
		if(data_out_0 != a || gate_out_0 != a || behav_out_0 != a) begin
			$display("===== t=%d FAILED, output does not match =====",$time);
			$display("===== t=%d Expected value is %b, Actual gate value is %b, Actual data value is %b, Actual behavioral value is %b =====",$time, a, gate_out_0, data_out_0, behav_out_0);
		end
		else begin
			$display("===== t=%d PASSED SUCCESSFULLY =====",$time);
		end
		
		$display("====== A = 1, S = 2'b01 =======");
		a = 1; s = 2'b01;
		#1;
		if(data_out_1 != a || gate_out_1 != a || behav_out_1 != a) begin
			$display("===== t=%d FAILED, output does not match =====",$time);
			$display("===== t=%d Expected value is %b, Actual gate value is %b, Actual data value is %b, Actual behavioral value is %b =====",$time, a, gate_out_0, data_out_0, behav_out_0);
		end
		else begin
			$display("===== t=%d PASSED SUCCESSFULLY =====",$time);
		end

		$display("====== A = 1, S = 2'b10  =======");
		a = 1; s = 2'b10;
		#1;
		if(data_out_2 != a || gate_out_2 != a || behav_out_2 != a) begin
			$display("===== t=%d FAILED, output does not match =====",$time);
			$display("===== t=%d Expected value is %b, Actual gate value is %b, Actual data value is %b, Actual behavioral value is %b =====",$time,a, gate_out_1, data_out_1, behav_out_1);
		end
		else begin
			$display("===== t=%d PASSED SUCCESSFULLY =====",$time);
		end
		
		$display("====== A = 1, S = 2'b1 =======");
		a = 1; s = 2'b11;
		#1;
		if(data_out_3 != a || gate_out_3 != a || behav_out_3 != a) begin
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