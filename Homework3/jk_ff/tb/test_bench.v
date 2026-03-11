module test_bench;

	reg		clk;
	reg		J, K;
	wire 		Q;

	jk_ff DUT(.*);

	initial begin
		clk = 0;
		forever #25 clk = ~clk;
	end

	initial begin
		$dumpfile("wave.vcd");
		$dumpvars(0,test_bench);
		$display("===== SR Flip Flop Testbench =====");
		$monitor("===== With J = %b, K = %b =====", J, K);
		J = 0; K = 0;
		@(posedge clk); 
		#1;
		if(Q!=0) begin
			$display("===== t=%d FAILED, output does not match =====",$time);
			$display("===== t=%d Expected value is %b, Actual value is %b =====",$time, 0, Q);
		end
		else begin
			$display("===== t=%d PASSED SUCCESSFULLY =====",$time);
		end


		#50 J = 0; K = 1;
		@(posedge clk); 
		#1;
		if(Q!=0) begin
			$display("===== t=%d FAILED, output does not match =====",$time);
			$display("===== t=%d Expected value is %b, Actual value is %b =====",$time, 0, Q);
		end
		else begin
			$display("===== t=%d PASSED SUCCESSFULLY =====",$time);
		end

		#50 J = 1; K = 0;
		@(posedge clk);
		#1;
		if(Q!=1) begin
			$display("===== t=%d FAILED, output does not match =====",$time);
			$display("===== t=%d Expected value is %b, Actual value is %b =====",$time, 1, Q);
		end
		else begin
			$display("===== t=%d PASSED SUCCESSFULLY =====",$time);
		end
		
		#50 J = 1; K = 1;
		@(posedge clk);
		#1;
		if(Q!=0) begin
			$display("===== t=%d FAILED, output does not match =====",$time);
			$display("===== t=%d Expected value is %b, Actual value is %b =====",$time, 0, Q);
		end
		else begin
			$display("===== t=%d PASSED SUCCESSFULLY =====",$time);
		end

		#10;
		$finish;
	end
	
endmodule