module test_bench7;

	reg		I0, I1, I2, I3;
	wire	[1:0]	data_out, gate_out, behav_out;

	binary_encoder DUT(.*);

	initial begin
		$dumpfile("wave.vcd");
		$dumpvars(0,test_bench7);
		$display("===== Test Encoder =====");
		$display("====== I0 = 0, I1 = 0, I2 = 0, I3 = 0 =======");
		I0 = 0; I1 = 0; I2 = 0; I3 = 0;
		#1;
		if(data_out != 2'b00 || gate_out != 2'b00 || behav_out != 2'b00) begin
			$display("===== t=%d FAILED, output does not match =====",$time);
			$display("===== t=%d Expected value is %b, Actual gate value is %b, Actual data value is %b, Actual behavioral value is %b =====",$time, 2'b00, data_out, gate_out, behav_out);
		end
		else begin
			$display("===== t=%d PASSED SUCCESSFULLY =====",$time);
		end
		
		$display("====== I0 = 1, I1 = 0, I2 = 0, I3 = 0 =======");
		I0 = 1; I1 = 0; I2 = 0; I3 = 0;
		#1;
		if(data_out != 2'b00 || gate_out != 2'b00 || behav_out != 2'b00) begin
			$display("===== t=%d FAILED, output does not match =====",$time);
			$display("===== t=%d Expected value is %b, Actual gate value is %b, Actual data value is %b, Actual behavioral value is %b =====",$time, 2'b00, data_out, gate_out, behav_out);
		end
		else begin
			$display("===== t=%d PASSED SUCCESSFULLY =====",$time);
		end

		$display("====== I0 = 0, I1 = 1, I2 = 0, I3 = 0 =======");
		I0 = 0; I1 = 1; I2 = 0; I3 = 0;
		#1;
		if(data_out != 2'b01 || gate_out != 2'b01 || behav_out != 2'b01) begin
			$display("===== t=%d FAILED, output does not match =====",$time);
			$display("===== t=%d Expected value is %b, Actual gate value is %b, Actual data value is %b, Actual behavioral value is %b =====",$time, 2'b01, data_out, gate_out, behav_out);
		end
		else begin
			$display("===== t=%d PASSED SUCCESSFULLY =====",$time);
		end

		$display("====== I0 = 0, I1 = 0, I2 = 1, I3 = 0 =======");
		I0 = 0; I1 = 0; I2 = 1; I3 = 0;
		#1;
		if(data_out != 2'b10 || gate_out != 2'b10 || behav_out != 2'b10) begin
			$display("===== t=%d FAILED, output does not match =====",$time);
			$display("===== t=%d Expected value is %b, Actual gate value is %b, Actual data value is %b, Actual behavioral value is %b =====",$time, 2'b10, data_out, gate_out, behav_out);
		end
		else begin
			$display("===== t=%d PASSED SUCCESSFULLY =====",$time);
		end

		$display("====== I0 = 0, I1 = 0, I2 = 0, I3 = 1 =======");
		I0 = 0; I1 = 0; I2 = 0; I3 = 1;
		#1;
		if(data_out != 2'b11 || gate_out != 2'b11 || behav_out != 2'b11) begin
			$display("===== t=%d FAILED, output does not match =====",$time);
			$display("===== t=%d Expected value is %b, Actual gate value is %b, Actual data value is %b, Actual behavioral value is %b =====",$time, 2'b11, data_out, gate_out, behav_out);
		end
		else begin
			$display("===== t=%d PASSED SUCCESSFULLY =====",$time);
		end
		
		#1;
		$finish;
	end

endmodule