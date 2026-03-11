module test_bench18;

	reg	a, b, bin;
	wire	gate_out, data_out, behav_out;
	wire	gate_carry, data_carry, behav_carry;

	subtractor_1bit DUT(.*);

	initial begin
		$dumpfile("wave18.vcd");
		$dumpvars(0,test_bench18);
		$display("===== Test 1 Bit Subtractor =====");
		$monitor("===== A = %b, B = %b, Bin = %b =====", a, b, bin);
		a=0; b=0; bin=0;
		#1;	
		check_result(0, gate_out, data_out, behav_out);
		check_borrow(0, gate_carry, data_carry, behav_carry);
		a=0; b=0; bin=1;
		#1;
		check_result(1, gate_out, data_out, behav_out);
		check_borrow(1, gate_carry, data_carry, behav_carry);
		a=0; b=1; bin=0;
		#1;
		check_result(1, gate_out, data_out, behav_out);
		check_borrow(1, gate_carry, data_carry, behav_carry);
		a=0; b=1; bin=1;
		#1;
		check_result(0, gate_out, data_out, behav_out);
		check_borrow(1, gate_carry, data_carry, behav_carry);
		a=1; b=0; bin=0;
		#1;
		check_result(1, gate_out, data_out, behav_out);
		check_borrow(0, gate_carry, data_carry, behav_carry);
		a=1; b=0; bin=1;
		#1;
		check_result(0, gate_out, data_out, behav_out);
		check_borrow(0, gate_carry, data_carry, behav_carry);
		a=1; b=1; bin=0;
		#1;
		check_result(0, gate_out, data_out, behav_out);
		check_borrow(0, gate_carry, data_carry, behav_carry);
		a=1; b=1; bin=1;
		#1;
		check_result(1, gate_out, data_out, behav_out);
		check_borrow(1, gate_carry, data_carry, behav_carry);

		#1;
		$finish;		

	end

	task check_result;
		input	expected_result;
		input	g_out;
		input	d_out;
		input	b_out;
		if(g_out != expected_result || d_out != expected_result || b_out != expected_result) begin
			$display("===== t=%d FAILED, output does not match =====", $time);
			$display("===== t=%d Expected output is %b, Actual gate output is %b, Actual dataflow output is %b, Actual behavioral output is %b =====",$time, expected_result, g_out, d_out, b_out);
		end
		else begin
			$display("===== t=%d PASSED SUCCESSFULLY =====",$time);
		end
	endtask

	task check_borrow;
		input	expected_borrow;
		input	g_borrow;
		input	d_borrow;
		input	b_borrow;
		if(g_borrow != expected_borrow || d_borrow != expected_borrow || b_borrow != expected_borrow) begin
			$display("===== t=%d FAILED, output does not match =====", $time);
			$display("===== t=%d Expected carry is %b, Actual gate carry is %b, Actual dataflow carry is %b, Actual behavioral carry is %b =====",$time, expected_borrow, g_borrow, d_borrow, b_borrow);
		end
		else begin
			$display("===== t=%d PASSED SUCCESSFULLY =====",$time);
		end
	endtask

endmodule