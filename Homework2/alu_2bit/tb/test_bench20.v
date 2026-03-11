module test_bench20;

	reg	[1:0]	a, b, SL;
	wire	[1:0] 	data_out, behav_out;
	wire		data_carry, behav_carry;

	alu_2bit DUT(.*);

	initial begin
		$dumpfile("wave20.vcd");
		$dumpvars(0,test_bench20);
		$display("===== Test Alu 2bit =====");
		$monitor("===== A = %b , B = %b, Control bits = %b =====", a, b, SL);
		$display("===== Check AND Case =====");
		a=2'b00; b=2'b00; SL=2'b00;
		#1;	
		check_result(2'b00, data_out, behav_out);
		check_carry(0, data_carry, behav_carry);

		a=2'b00; b=2'b01; SL=2'b00;
		#1;	
		check_result(2'b00, data_out, behav_out);
		check_carry(0, data_carry, behav_carry);

		a=2'b00; b=2'b10; SL=2'b00;
		#1;	
		check_result(2'b00, data_out, behav_out);
		check_carry(0, data_carry, behav_carry);

		a=2'b01; b=2'b01; SL=2'b00;
		#1;	
		check_result(2'b01, data_out, behav_out);
		check_carry(0, data_carry, behav_carry);

		a=2'b10; b=2'b10; SL=2'b00;
		#1;	
		check_result(2'b10, data_out, behav_out);
		check_carry(0, data_carry, behav_carry);

		a=2'b01; b=2'b10; SL=2'b00;
		#1;	
		check_result(2'b00, data_out, behav_out);
		check_carry(0, data_carry, behav_carry);

		a=2'b11; b=2'b01; SL=2'b00;
		#1;	
		check_result(2'b01, data_out, behav_out);
		check_carry(0, data_carry, behav_carry);

		a=2'b11; b=2'b11; SL=2'b00;
		#1;	
		check_result(2'b11, data_out, behav_out);
		check_carry(0, data_carry, behav_carry);

		$display("===== Check OR Case =====");
		a=2'b00; b=2'b00; SL=2'b01;
		#1;	
		check_result(2'b00, data_out, behav_out);
		check_carry(0, data_carry, behav_carry);

		a=2'b00; b=2'b01; SL=2'b01;
		#1;	
		check_result(2'b01, data_out, behav_out);
		check_carry(0, data_carry, behav_carry);

		a=2'b00; b=2'b10; SL=2'b01;
		#1;	
		check_result(2'b10, data_out, behav_out);
		check_carry(0, data_carry, behav_carry);

		a=2'b01; b=2'b01; SL=2'b01;
		#1;	
		check_result(2'b01, data_out, behav_out);
		check_carry(0, data_carry, behav_carry);

		a=2'b10; b=2'b10; SL=2'b01;
		#1;	
		check_result(2'b10, data_out, behav_out);
		check_carry(0, data_carry, behav_carry);

		a=2'b01; b=2'b10; SL=2'b01;
		#1;	
		check_result(2'b11, data_out, behav_out);
		check_carry(0, data_carry, behav_carry);

		a=2'b11; b=2'b01; SL=2'b01;
		#1;	
		check_result(2'b11, data_out, behav_out);
		check_carry(0, data_carry, behav_carry);

		a=2'b11; b=2'b11; SL=2'b01;
		#1;	
		check_result(2'b11, data_out, behav_out);
		check_carry(0, data_carry, behav_carry);
			
		$display("===== Check ADD Case =====");
		a=2'b00; b=2'b00; SL=2'b10;
		#1;	
		check_result(2'b00, data_out, behav_out);
		check_carry(0, data_carry, behav_carry);

		a=2'b00; b=2'b01; SL=2'b10;
		#1;	
		check_result(2'b01, data_out, behav_out);
		check_carry(0, data_carry, behav_carry);

		a=2'b00; b=2'b10; SL=2'b10;
		#1;	
		check_result(2'b10, data_out, behav_out);
		check_carry(0, data_carry, behav_carry);

		a=2'b01; b=2'b01; SL=2'b10;
		#1;	
		check_result(2'b10, data_out, behav_out);
		check_carry(0, data_carry, behav_carry);

		a=2'b10; b=2'b10; SL=2'b10;
		#1;	
		check_result(2'b00, data_out, behav_out); // 2+2 = 4 (0b100), carry=1
		check_carry(1, data_carry, behav_carry);

		a=2'b01; b=2'b10; SL=2'b10;
		#1;	
		check_result(2'b11, data_out, behav_out); // 1+2=3
		check_carry(0, data_carry, behav_carry);

		a=2'b11; b=2'b01; SL=2'b10;
		#1;	
		check_result(2'b00, data_out, behav_out); // 3+1=4 (0b100), carry=1
		check_carry(1, data_carry, behav_carry);

		a=2'b11; b=2'b11; SL=2'b10;
		#1;	
		check_result(2'b10, data_out, behav_out); // 3+3=6 (0b110), carry=1
		check_carry(1, data_carry, behav_carry);

		
		#1;
		$finish;		

	end

	task check_result;
		input 	[1:0]	expected_result;
		input	[1:0]	d_out;
		input	[1:0]	b_out;
		if(d_out != expected_result || b_out != expected_result) begin
			$display("===== t=%d FAILED, output does not match =====", $time);
			$display("===== t=%d Expected output is %b, Actual dataflow output is %b, Actual behavioral output is %b =====",$time, expected_result, d_out, b_out);
		end
		else begin
			$display("===== t=%d PASSED SUCCESSFULLY =====",$time);
		end
	endtask

	task check_carry;
		input	expected_carry;
		input	d_carry;
		input	b_carry;
		if(d_carry != expected_carry || b_carry != expected_carry) begin
			$display("===== t=%d FAILED, output does not match =====", $time);
			$display("===== t=%d Expected carry is %b, Actual dataflow carry is %b, Actual behavioral carry is %b =====",$time, expected_carry, d_carry, b_carry);
		end
		else begin
			$display("===== t=%d PASSED SUCCESSFULLY =====",$time);
		end
	endtask

endmodule