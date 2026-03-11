module test_bench;

	reg		clk, rst_n;
	reg		sr_in, sl_in;
	reg	[1:0]	S;
	reg	[3:0]	p_din;
	wire	[3:0]	p_dout;
	wire		sl_out, sr_out;

	universal_shift_register DUT(.*);

	initial begin
		clk = 0;
		forever #25 clk = ~clk;
	end

	initial begin
		$dumpfile("wave.vcd");
		$dumpvars(0,test_bench);
		$display("===== Universal Shift Register Testbench =====");
		$monitor("\n===== Input value is %4b, Selection's value is %2b, New right value is %b, New left value is %b =====", p_din, S, sr_in, sl_in);
		$display("===== Initial Case: Reset value is Low =====");
		rst_n = 0;
		#1;
		check_result(4'b0000, p_dout);

		$display("===== Case: Reset value is High =====");
		rst_n = 1;
		p_din = 4'b0000; sr_in = 0; sl_in = 0; S = 2'b00;
		@(posedge clk);
		#1;
		check_result(4'b0000, p_dout);

		p_din = 4'b1111; sr_in = 0; sl_in = 0; S = 2'b00;
		@(posedge clk);
		#1;
		check_result(4'b0000, p_dout);
		
		p_din = 4'b1111; sr_in = 0; sl_in = 0; S = 2'b11;
		@(posedge clk);
		#1;
		check_result(4'b1111, p_dout);

		p_din = 4'b1111; sr_in = 0; sl_in = 0; S = 2'b10;
		@(posedge clk);
		#1;
		check_result(4'b1110, p_dout);
		check_shift(1'b1, sl_out);

		p_din = 4'b1111; sr_in = 0; sl_in = 0; S = 2'b01;
		@(posedge clk);
		#1;
		check_result(4'b0111, p_dout);
		check_shift(1'b1, sr_out);

		p_din = 4'b1001; sr_in = 0; sl_in = 0; S = 2'b11;
		@(posedge clk);
		#1;
		check_result(4'b1001, p_dout);

		sr_in = 0; sl_in = 1; S = 2'b10;
		@(posedge clk);
		#1;
		check_result(4'b0011, p_dout);
		check_shift(1'b1, sl_out);

		sr_in = 0; sl_in = 1; S = 2'b01;
		@(posedge clk);
		#1;
		check_result(4'b0001, p_dout);
		check_shift(1'b1, sr_out);

		#10;
		$finish;
	end

	task check_result;
		input	[3:0]	a;
		input	[3:0] 	b;
		if(a!=b) begin
			$display("===== t=%d FAILED, output does not match =====",$time);
			$display("===== t=%d Expected value is %b, Actual value is %b =====",$time, a, b);
		end
		else begin
			$display("===== t=%d PASSED SUCCESSFULLY =====",$time);
		end
	endtask

	task check_shift;
		input		c;
		input	 	d;
		if(c!=d) begin
			$display("===== t=%d FAILED, shift value does not match =====",$time);
			$display("===== t=%d Expected value is %b, Actual value is %b =====",$time, c, d);
		end
		else begin
			$display("===== t=%d PASSED SUCCESSFULLY =====",$time);
		end
	endtask
endmodule