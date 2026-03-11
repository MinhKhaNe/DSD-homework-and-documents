module test_bench17;

	reg	[1:0]	a, b; 
	reg		s;
	wire	[1:0]	data_out, gate_out, behav_out;

	mux_2bit DUT(.*);

	initial begin
		$dumpfile("wave17.vcd");
		$dumpvars(0,test_bench17);
		$display("===== Test MUX 2 bits =====");
		$display("====== A = 2'b01, B = 2'b00, S = 0  =======");
		a = 2'b01; b = 2'b00; s = 0;
		#1;
		if(data_out != b || gate_out != b || behav_out != b) begin
			$display("===== t=%d FAILED, output does not match =====",$time);
			$display("===== t=%d Expected value is %b, Actual gate value is %b, Actual data value is %b, Actual behavioral value is %b =====",$time, b, data_out, gate_out, behav_out);
		end
		else begin
			$display("===== t=%d PASSED SUCCESSFULLY =====",$time);
		end
		
		$display("====== A = 2'b01, B = 2'b00, S = 1  =======");
		a = 2'b01; b = 2'b00; s = 1;
		#1;
		if(data_out != a || gate_out != a || behav_out != a) begin
			$display("===== t=%d FAILED, output does not match =====",$time);
			$display("===== t=%d Expected value is %b, Actual gate value is %b, Actual data value is %b, Actual behavioral value is %b =====",$time, a, data_out, gate_out, behav_out);
		end
		else begin
			$display("===== t=%d PASSED SUCCESSFULLY =====",$time);
		end

		$display("====== A = 2'b00, B = 2'b01, S = 0  =======");
		a = 2'b00; b = 2'b01; s = 0;
		#1;
		if(data_out != b || gate_out != b || behav_out != b) begin
			$display("===== t=%d FAILED, output does not match =====",$time);
			$display("===== t=%d Expected value is %b, Actual gate value is %b, Actual data value is %b, Actual behavioral value is %b =====",$time, b, data_out, gate_out, behav_out);
		end
		else begin
			$display("===== t=%d PASSED SUCCESSFULLY =====",$time);
		end

		$display("====== A = 2'b00, B = 2'b01, S = 1  =======");
		a = 2'b00; b = 2'b01; s = 1;
		#1;
		if(data_out != a || gate_out != a || behav_out != a) begin
			$display("===== t=%d FAILED, output does not match =====",$time);
			$display("===== t=%d Expected value is %b, Actual gate value is %b, Actual data value is %b, Actual behavioral value is %b =====",$time, a, data_out, gate_out, behav_out);
		end
		else begin
			$display("===== t=%d PASSED SUCCESSFULLY =====",$time);
		end
		#1;
		$finish;
	end

endmodule