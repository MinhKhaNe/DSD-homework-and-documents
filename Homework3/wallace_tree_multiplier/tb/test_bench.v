module test_bench;

	reg	[3:0]	a, b;
	wire	[7:0]	gate_out, data_out, behav_out;
	integer		i, j;

	wallace_tree_multiplier DUT(.*);

	initial begin
		$dumpfile("wave.vcd");
		$dumpvars(0,test_bench);
		$display("===== Test Wallace Tree Multiplier =====");
		$monitor("===== Q = %4b, M = %4b =====", a, b);
		for(i = 0; i < 16; i = i + 1) begin
			for(j = 0; j < 16; j = j + 1) begin
				a = i[3:0];
               			b = j[3:0];
               			#1;
                		check_result(a * b, gate_out, data_out, behav_out);
			end
		end
		$display("===== t=%d Finished Stimulation =====",$time);
		$finish;
	end

	task check_result;
		input	[7:0]	result;
		input	[7:0]	e;
		input	[7:0]	f;
		input	[7:0]	g;

		if(e!=result | f!=result | g!=result) begin
			$display("===== t=%d FAILED, output does not match =====",$time);
			$display("===== t=%d Expected value is %b, Actual gate value is %b, Actual data value is %b, Actual behavioral value is %b =====",$time, result, e, f, g);
		end
		else begin
			$display("===== t=%d PASSED SUCCESSFULLY =====",$time);
		end
	endtask
	
endmodule