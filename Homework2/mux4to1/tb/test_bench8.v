module test_bench8;

	reg	[1:0]	S;
	reg	I0, I1, I2, I3;
	wire	data_out, gate_out, behav_out;

	mux4to1 DUT(.*);

	initial begin
		$dumpfile("wave8.vcd");
		$dumpvars(0,test_bench8);
		$display("===== Test MUX 4 to 1 =====");
		$display("===== S = 2'b00, I0 = 1, I1 = 0, I2 = 0, I3 = 0 =====");
		S = 2'b00; I0 = 1; I1 = 0; I2 = 0; I3 = 0;
		#1;
		if(data_out!=I0 || gate_out!=I0 || behav_out!=I0) begin
			$display("===== t=%d FAILED, output does not match",$time);
			$display("===== t=%d Expected value is %b, Actual gate_model value is %b, Actual dataflow value is %b, Actual behavioral model value is %b =====",$time, I0, data_out, gate_out, behav_out);
		end
		else begin
			$display("===== t=%d PASSED SUCCESSFULLY =====",$time);
		end

		$display("===== S = 2'b01, I0 = 0, I1 = 1, I2 = 0, I3 = 0 =====");
		S = 2'b01; I0 = 0; I1 = 1; I2 = 0; I3 = 0;
		#1;
		if(data_out!=I1 || gate_out!=I1 || behav_out!=I1) begin
			$display("===== t=%d FAILED, output does not match",$time);
			$display("===== t=%d Expected value is %b, Actual gate_model value is %b, Actual dataflow value is %b, Actual behavioral model value is %b =====",$time, I1, data_out, gate_out, behav_out);
		end
		else begin
			$display("===== t=%d PASSED SUCCESSFULLY =====",$time);
		end	

		$display("===== S = 2'b10, I0 = 0, I1 = 0, I2 = 1, I3 = 0 =====");
		S = 2'b10; I0 = 0; I1 = 0; I2 = 1; I3 = 0;
		#1;
		if(data_out!=I2 || gate_out!=I2 || behav_out!=I2) begin
			$display("===== t=%d FAILED, output does not match",$time);
			$display("===== t=%d Expected value is %b, Actual gate_model value is %b, Actual dataflow value is %b, Actual behavioral model value is %b =====",$time, I2, data_out, gate_out, behav_out);
		end
		else begin
			$display("===== t=%d PASSED SUCCESSFULLY =====",$time);
		end	

		$display("===== S = 2'b11, I0 = 0, I1 = 0, I2 = 0, I3 = 1 =====");
		S = 2'b11; I0 = 0; I1 = 0; I2 = 0; I3 = 1;
		#1;
		if(data_out!=I3 || gate_out!=I3 || behav_out!=I3) begin
			$display("===== t=%d FAILED, output does not match",$time);
			$display("===== t=%d Expected value is %b, Actual gate_model value is %b, Actual dataflow value is %b, Actual behavioral model value is %b =====",$time, I3, data_out, gate_out, behav_out);
		end
		else begin
			$display("===== t=%d PASSED SUCCESSFULLY =====",$time);
		end
	end

endmodule