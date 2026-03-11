module test_bench;

	reg	[1:0]	a, b;
	wire	[3:0]	gate_out, data_out, behav_out;

	array_multiplier DUT(.*);

	initial begin
		$dumpfile("wave.vcd");
		$dumpvars(0,test_bench);
		$display("===== Test Array Multiplier =====");
		$display("===== A = 2'b00, B = 2'b00 =====");
		a = 2'b00; b = 2'b00;
		#1;
		check_result(4'b0000, gate_out, data_out, behav_out);

		$display("===== A = 2'b00, B = 2'b01 =====");
		a = 2'b00; b = 2'b01;
		#1;
		check_result(4'b0000, gate_out, data_out, behav_out);

		$display("===== A = 2'b00, B = 2'b10 =====");
		a = 2'b00; b = 2'b10;
		#1;
		check_result(4'b0000, gate_out, data_out, behav_out);

		$display("===== A = 2'b00, B = 2'b11 =====");
		a = 2'b00; b = 2'b11;
		#1;
		check_result(4'b0000, gate_out, data_out, behav_out);

		$display("===== A = 2'b01, B = 2'b00 =====");
		a = 2'b01; b = 2'b00;
		#1;
		check_result(4'b0000, gate_out, data_out, behav_out);

		$display("===== A = 2'b01, B = 2'b01 =====");
		a = 2'b01; b = 2'b01;
		#1;
		check_result(4'b0001, gate_out, data_out, behav_out);

		$display("===== A = 2'b01, B = 2'b10 =====");
		a = 2'b01; b = 2'b10;
		#1;
		check_result(4'b0010, gate_out, data_out, behav_out);

		$display("===== A = 2'b01, B = 2'b11 =====");
		a = 2'b01; b = 2'b11;
		#1;
		check_result(4'b0011, gate_out, data_out, behav_out);

		$display("===== A = 2'b10, B = 2'b00 =====");
		a = 2'b10; b = 2'b00;
		#1;
		check_result(4'b0000, gate_out, data_out, behav_out);

		$display("===== A = 2'b10, B = 2'b01 =====");
		a = 2'b10; b = 2'b01;
		#1;
		check_result(4'b0010, gate_out, data_out, behav_out);

		$display("===== A = 2'b10, B = 2'b10 =====");
		a = 2'b10; b = 2'b10;
		#1;
		check_result(4'b0100, gate_out, data_out, behav_out);

		$display("===== A = 2'b10, B = 2'b11 =====");
		a = 2'b10; b = 2'b11;		
		#1;
		check_result(4'b0110, gate_out, data_out, behav_out);

		$display("===== A = 2'b11, B = 2'b00 =====");
		a = 2'b11; b = 2'b00;
		#1;
		check_result(4'b0000, gate_out, data_out, behav_out);

		$display("===== A = 2'b11, B = 2'b01 =====");
		a = 2'b11; b = 2'b01;
		#1;
		check_result(4'b0011, gate_out, data_out, behav_out);

		$display("===== A = 2'b11, B = 2'b10 =====");
		a = 2'b11; b = 2'b10;
		#1;
		check_result(4'b0110, gate_out, data_out, behav_out);

		$display("===== A = 2'b11, B = 2'b11 =====");
		a = 2'b11; b = 2'b11;
		#1;
		check_result(4'b1001, gate_out, data_out, behav_out);
		
	end

	task check_result;
		input	[3:0]	result;
		input	[3:0]	e;
		input	[3:0]	f;
		input	[3:0]	g;

		if(e!=result | f!=result | g!=result) begin
			$display("===== t=%d FAILED, output does not match =====",$time);
			$display("===== t=%d Expected value is %b, Actual gate value is %b, Actual data value is %b, Actual behavioral value is %b =====",$time, result, e, f, g);
		end
		else begin
			$display("===== t=%d PASSED SUCCESSFULLY =====",$time);
		end
	endtask
	
endmodule