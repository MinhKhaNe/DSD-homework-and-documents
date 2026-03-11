module test_bench13;

	reg	[1:0]	a, b;
	wire	[1:0]	gate_out, data_out, behav_out;
	wire		gate_carry, data_carry, behav_carry;
	integer		i, j;

	subtractor_2bit DUT(.*);

	initial begin
		$dumpfile("wave13.vcd");
        	$dumpvars(0,test_bench13);
        	$display("===== Test Subtractor 2 bits =====");

		for (i = 0; i < 4; i = i + 1) begin
            		for (j = 0; j < 4; j = j + 1) begin
                    		a   = i;
       			        b   = j;
                    		#1; 

                    		$display("\n===== t=%d With A = %2d, B = %2d : Actual gate_model value is %2d, Actual dataflow value is %2d, Actual behavioural model value is %2d", $time, a, b, gate_out, data_out, behav_out);
				$display("===== t=%d Actual gate_model carry is %b, Actual dataflow carry is %b, Actual behavioural model carry is %b", $time, gate_carry, data_carry, behav_carry);
            		end
		end

	end

endmodule