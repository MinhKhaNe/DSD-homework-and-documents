module test_bench5;

	reg	a, b;
	wire 	gate_sum, data_sum, behav_sum;
	wire 	gate_carry, data_carry, behav_carry;

	half_adder DUT(.*);

	initial begin
		$dumpfile("wave5.vcd");
		$dumpvars(0,test_bench5);
		$display("===== Half Adder Testbench =====");
		$display("===== A = 0, B = 0 =====");
		a = 0; b = 0;
		if(gate_sum!=0 || data_sum!=0 || behav_sum!=0) begin
			$display("===== t=%d FAILED, value does not match =====", $time);
			$display("===== t=%d Expected value is %b, Actual gate_model value is %b, Actual dataflow value is %b, Actual behavioral_model value is %b =====", $time, 0, gate_sum, data_sum, behav_sum);
		end
		else if(gate_carry!=0 || data_carry!=0 || behav_carry!=0) begin
			$display("===== t=%d FAILED, value does not match =====", $time);
			$display("===== t=%d Expected value is %b, Actual gate_model carry is %b, Actual dataflow carry is %b, Actual behavioral_model carry is %b =====", $time, 0, gate_carry, data_carry, behav_carry);
		end
		else begin
			$display("===== PASSED SUCCESSFULLY =====");
		end

		#1;
		$display("===== A = 0, B = 1 =====");
		a = 0; b = 1;
		#1;
		if(gate_sum!=1 || data_sum!=1 || behav_sum!=1) begin
			$display("===== t=%d FAILED, value does not match =====", $time);
			$display("===== t=%d Expected value is %b, Actual gate_model value is %b, Actual dataflow value is %b, Actual behavioral_model value is %b =====", $time, 1, gate_sum, data_sum, behav_sum);
		end
		else if(gate_carry!=0 || data_carry!=0 || behav_carry!=0) begin
			$display("===== t=%d FAILED, value does not match =====", $time);
			$display("===== t=%d Expected value is %b, Actual gate_model carry is %b, Actual dataflow carry is %b, Actual behavioral_model carry is %b =====", $time, 0, gate_carry, data_carry, behav_carry);
		end
		else begin
			$display("===== PASSED SUCCESSFULLY =====");
		end

		#1;
		$display("===== A = 1, B = 0 =====");
		a = 1; b = 0;
		#1;
		if(gate_sum!=1 || data_sum!=1 || behav_sum!=1) begin
			$display("===== t=%d FAILED, value does not match =====", $time);
			$display("===== t=%d Expected value is %b, Actual gate_model value is %b, Actual dataflow value is %b, Actual behavioral_model value is %b =====", $time, 1, gate_sum, data_sum, behav_sum);
		end
		else if(gate_carry!=0 || data_carry!=0 || behav_carry!=0) begin
			$display("===== t=%d FAILED, value does not match =====", $time);
			$display("===== t=%d Expected value is %b, Actual gate_model carry is %b, Actual dataflow carry is %b, Actual behavioral_model carry is %b =====", $time, 0, gate_carry, data_carry, behav_carry);
		end
		else begin
			$display("===== PASSED SUCCESSFULLY =====");
		end

		#1;
		$display("===== A = 1, B = 1 =====");
		a = 1; b = 1;
		#1;
		if(gate_sum!=0 || data_sum!=0 || behav_sum!=0) begin
			$display("===== t=%d FAILED, value does not match =====", $time);
			$display("===== t=%d Expected value is %b, Actual gate_model value is %b, Actual dataflow value is %b, Actual behavioral_model value is %b =====", $time, 1, gate_sum, data_sum, behav_sum);
		end
		else if(gate_carry!=1 || data_carry!=1 || behav_carry!=1) begin
			$display("===== t=%d FAILED, value does not match =====", $time);
			$display("===== t=%d Expected value is %b, Actual gate_model carry is %b, Actual dataflow carry is %b, Actual behavioral_model carry is %b =====", $time, 1, gate_carry, data_carry, behav_carry);
		end
		else begin
			$display("===== PASSED SUCCESSFULLY =====");
		end

		#1;
		$finish;
	end
	
endmodule