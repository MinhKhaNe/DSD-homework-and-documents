module test_bench19;

	reg	[3:0]	a;
	wire	[4:0]	gate_out, data_out, behav_out;
	wire		gate_parity, data_parity, behav_parity;

	parity_generator DUT(.*);

	initial begin
		$dumpfile("wave19.vcd");
		$dumpvars(0,test_bench19);
		$display("===== Test Parity Generator =====");
		$monitor("===== A = %b =====", a);
		a=4'b0000;
		#1;	
		check_result(5'b00001, gate_out, data_out, behav_out);
		check_parity(1, gate_parity, data_parity, behav_parity);

		a=4'b0001;
		#1;	
		check_result(5'b00010, gate_out, data_out, behav_out);
		check_parity(0, gate_parity, data_parity, behav_parity);

		a=4'b0010;
		#1;	
		check_result(5'b00100, gate_out, data_out, behav_out);
		check_parity(0, gate_parity, data_parity, behav_parity);

		a=4'b0100;
		#1;	
		check_result(5'b01000, gate_out, data_out, behav_out);
		check_parity(0, gate_parity, data_parity, behav_parity);

		a=4'b1000;
		#1;	
		check_result(5'b10000, gate_out, data_out, behav_out);
		check_parity(0, gate_parity, data_parity, behav_parity);

		a=4'b0011;
		#1;	
		check_result(5'b00111, gate_out, data_out, behav_out);
		check_parity(1, gate_parity, data_parity, behav_parity);

		a=4'b0111;
		#1;	
		check_result(5'b01110, gate_out, data_out, behav_out);
		check_parity(0, gate_parity, data_parity, behav_parity);

		a=4'b0101;
		#1;	
		check_result(5'b01011, gate_out, data_out, behav_out);
		check_parity(1, gate_parity, data_parity, behav_parity);	

		a=4'b1101;
		#1;	
		check_result(5'b11010, gate_out, data_out, behav_out);
		check_parity(0, gate_parity, data_parity, behav_parity);

		a=4'b1011;
		#1;	
		check_result(5'b10110, gate_out, data_out, behav_out);
		check_parity(0, gate_parity, data_parity, behav_parity);

		a=4'b1111;
		#1;	
		check_result(5'b11111, gate_out, data_out, behav_out);
		check_parity(1, gate_parity, data_parity, behav_parity);	
		
		#1;
		$finish;		

	end

	task check_result;
		input 	[4:0]	expected_result;
		input	[4:0]	g_out;
		input	[4:0]	d_out;
		input	[4:0]	b_out;
		if(g_out != expected_result || d_out != expected_result || b_out != expected_result) begin
			$display("===== t=%d FAILED, output does not match =====", $time);
			$display("===== t=%d Expected output is %b, Actual gate output is %b, Actual dataflow output is %b, Actual behavioral output is %b =====",$time, expected_result, g_out, d_out, b_out);
		end
		else begin
			$display("===== t=%d PASSED SUCCESSFULLY =====",$time);
		end
	endtask

	task check_parity;
		input	expected_parity;
		input	g_parity;
		input	d_parity;
		input	b_parity;
		if(g_parity != expected_parity || d_parity != expected_parity || b_parity != expected_parity) begin
			$display("===== t=%d FAILED, output does not match =====", $time);
			$display("===== t=%d Expected parity is %b, Actual gate parity is %b, Actual dataflow parity is %b, Actual behavioral parity is %b =====",$time, expected_parity, g_parity, d_parity, b_parity);
		end
		else begin
			$display("===== t=%d PASSED SUCCESSFULLY =====",$time);
		end
	endtask

endmodule