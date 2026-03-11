module test_bench;

	reg		clk, rst_n;
	reg	[1:0]	in;
	wire 	[1:0]	out;

	dff_syn DUT(.*);

	initial begin
		clk = 0;
		forever #25 clk = ~clk;
	end

	initial begin
		$dumpfile("wave.vcd");
		$dumpvars(0,test_bench);
		$display("===== DFF With Synchronous Reset Testbench =====");
		in = 2'b00;
		rst_n = 0;
		@(posedge clk); 
		#1;
		if(out!=0) begin
			$display("===== t=%d FAILED, output does not match =====",$time);
			$display("===== t=%d Expected value is %b, Actual value is %b =====",$time, 0, out);
		end
		else begin
			$display("===== t=%d PASSED SUCCESSFULLY =====",$time);
		end
		rst_n = 1;
		#50 in = 2'b01;
		#1;
		if(out!=0) begin
			$display("===== t=%d FAILED, output does not match =====",$time);
			$display("===== t=%d Expected value is %b, Actual value is %b =====",$time, 0, out);
		end
		else begin
			$display("===== t=%d PASSED SUCCESSFULLY =====",$time);
		end

		@(posedge clk); 
		#1;
		if(out!=2'b01) begin
			$display("===== t=%d FAILED, output does not match =====",$time);
			$display("===== t=%d Expected value is %b, Actual value is %b =====",$time, 2'b01, out);
		end
		else begin
			$display("===== t=%d PASSED SUCCESSFULLY =====",$time);
		end
		#50 in = 2'b10;
		if(out!=2'b01) begin
			$display("===== t=%d FAILED, output does not match =====",$time);
			$display("===== t=%d Expected value is %b, Actual value is %b =====",$time, 2'b01, out);
		end
		else begin
			$display("===== t=%d PASSED SUCCESSFULLY =====",$time);
		end

		@(posedge clk);
		#1;
		if(out!=2'b10) begin
			$display("===== t=%d FAILED, output does not match =====",$time);
			$display("===== t=%d Expected value is %b, Actual value is %b =====",$time, 2'b10, out);
		end
		else begin
			$display("===== t=%d PASSED SUCCESSFULLY =====",$time);
		end

		#50 in = 2'b11;
		if(out!=2'b10) begin
			$display("===== t=%d FAILED, output does not match =====",$time);
			$display("===== t=%d Expected value is %b, Actual value is %b =====",$time, 2'b10, out);
		end
		else begin
			$display("===== t=%d PASSED SUCCESSFULLY =====",$time);
		end

		@(posedge clk);
		#1;
		if(out!=2'b11) begin
			$display("===== t=%d FAILED, output does not match =====",$time);
			$display("===== t=%d Expected value is %b, Actual value is %b =====",$time, 2'b11, out);
		end
		else begin
			$display("===== t=%d PASSED SUCCESSFULLY =====",$time);
		end

		#10;
		$finish;
	end
	
endmodule