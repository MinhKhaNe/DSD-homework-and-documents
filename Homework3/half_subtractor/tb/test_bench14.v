module test_bench14;

	reg	a, b;
	wire	gate_out, data_out, behav_out;
	wire	gate_carry, data_carry, behav_carry;

	half_subtractor DUT(.*);

	initial begin
		$dumpfile("wave.vcd");
        	$dumpvars(0,test_bench14);
        	$display("===== Test Half Subtractor =====");
		$display("===== A = 1'b0, B = 1'b0 =====");
		a = 0; b = 0;
		#1;
		if(gate_out!=0 || data_out!=0 || behav_out!=0) begin
			$display("===== t=%d FAILED, output does not match =====",$time);
			$display("===== t=%d Expected value is %b, Actual gate_model value is %b, Actual dataflow value is %b, Actual behavioural model value is %b =====", $time, 0, gate_out, data_out, behav_out);
		end
		else if(gate_carry!=0 || data_carry!=0 || behav_carry!=0) begin
			$display("===== t=%d FAILED, output does not match =====",$time);
			$display("===== t=%d Expected value is %b, Actual gate_model value is %b, Actual dataflow value is %b, Actual behavioural model value is %b =====", $time, 0, gate_carry, data_carry, behav_carry);
		end
		else begin
			$display("===== t=%d PASSED SUCCESSFULLY =====", $time);
		end

		$display("===== A = 1'b0, B = 1'b1 =====");
		a = 0; b = 1;
		#1;
		if(gate_out!=1 || data_out!=1 || behav_out!=1) begin
			$display("===== t=%d FAILED, output does not match =====",$time);
			$display("===== t=%d Expected value is %b, Actual gate_model value is %b, Actual dataflow value is %b, Actual behavioural model value is %b =====", $time, 1, gate_out, data_out, behav_out);
		end
		else if(gate_carry!=1 || data_carry!=1 || behav_carry!=1) begin
			$display("===== t=%d FAILED, output does not match =====",$time);
			$display("===== t=%d Expected value is %b, Actual gate_model value is %b, Actual dataflow value is %b, Actual behavioural model value is %b =====", $time, 1, gate_carry, data_carry, behav_carry);
		end
		else begin
			$display("===== t=%d PASSED SUCCESSFULLY =====", $time);
		end

		$display("===== A = 1'b1, B = 1'b0 =====");
		a = 1; b = 0;
		#1;
		if(gate_out!=1 || data_out!=1 || behav_out!=1) begin
			$display("===== t=%d FAILED, output does not match =====",$time);
			$display("===== t=%d Expected value is %b, Actual gate_model value is %b, Actual dataflow value is %b, Actual behavioural model value is %b =====", $time, 1, gate_out, data_out, behav_out);
		end
		else if(gate_carry!=0 || data_carry!=0 || behav_carry!=0) begin
			$display("===== t=%d FAILED, output does not match =====",$time);
			$display("===== t=%d Expected value is %b, Actual gate_model value is %b, Actual dataflow value is %b, Actual behavioural model value is %b =====", $time, 0, gate_carry, data_carry, behav_carry);
		end
		else begin
			$display("===== t=%d PASSED SUCCESSFULLY =====", $time);
		end

		$display("===== A = 1'b1, B = 1'b1 =====");
		a = 1; b = 1;
		#1;
		if(gate_out!=0 || data_out!=0 || behav_out!=0) begin
			$display("===== t=%d FAILED, output does not match =====",$time);
			$display("===== t=%d Expected value is %b, Actual gate_model value is %b, Actual dataflow value is %b, Actual behavioural model value is %b =====", $time, 1, gate_out, data_out, behav_out);
		end
		else if(gate_carry!=0 || data_carry!=0 || behav_carry!=0) begin
			$display("===== t=%d FAILED, output does not match =====",$time);
			$display("===== t=%d Expected value is %b, Actual gate_model value is %b, Actual dataflow value is %b, Actual behavioural model value is %b =====", $time, 0, gate_carry, data_carry, behav_carry);
		end
		else begin
			$display("===== t=%d PASSED SUCCESSFULLY =====", $time);
		end
	end

endmodule