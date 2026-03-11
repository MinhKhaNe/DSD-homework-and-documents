module test_bench6;

	reg	a, b, cin;
	wire 	gate_sum, data_sum, behav_sum;
	wire 	gate_carry, data_carry, behav_carry;

	full_adder DUT(.*);

	initial begin
		$dumpfile("wave.vcd");
		$dumpvars(0,test_bench6);
		$display("===== Full Adder Testbench =====");
		$display("===== A = 0, B = 0, Cin = 0 =====");
		a = 0; b = 0; cin = 0;
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
		$display("===== A = 0, B = 1, Cin = 0 =====");
		a = 0; b = 1; cin = 0;
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
		$display("===== A = 1, B = 0, Cin = 0 =====");
		a = 1; b = 0; cin = 0;
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
		$display("===== A = 0, B = 0, Cin = 1 =====");
		a = 0; b = 0; cin = 1;
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
		$display("===== A = 1, B = 1, Cin = 0 =====");
		a = 1; b = 1; cin = 0;
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
		$display("===== A = 0, B = 1, Cin = 1 =====");
		a = 0; b = 1; cin = 1;
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
		$display("===== A = 1, B = 0, Cin = 1 =====");
		a = 1; b = 0; cin = 1;
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
		$display("===== A = 1, B = 1, Cin = 1 =====");
		a = 1; b = 1; cin = 1;
		#1;
		if(gate_sum!=1 || data_sum!=1 || behav_sum!=1) begin
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