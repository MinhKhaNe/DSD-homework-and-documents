module test_bench12;

	reg	[3:0]	a, b;
	reg		cin;
	wire	[3:0]	gate_out, data_out, behav_out;
	wire		gate_carry, data_carry, behav_carry;
	integer		i, j, k;

	adder_4bit DUT(.*);

	initial begin
		$dumpfile("wave12.vcd");
        	$dumpvars(0,test_bench12);
        	$display("===== Test Adder 4 bits =====");
		$display("===== Initial State =====");
		$display("===== A = 4'b0000, B = 4'b0000, Cin = 1'b0 =====");
		a = 4'b0000; b = 4'b0000; cin = 1'b0;
		#1;
		if(gate_out!=4'b0000 || data_out!=4'b0000 || behav_out!=4'b0000) begin
			$display("===== t=%d FAILED, output does not match =====",$time);
			$display("===== t=%d Expected value is %2d, Actual gate_model value is %2d, Actual dataflow value is %2d, Actual behavioural model value is %2d =====", $time, 4'b0000, gate_out, data_out, behav_out);
		end
		else begin
			$display("===== t=%d PASSED SUCCESSFULLY =====", $time);
		end

		for (i = 0; i < 16; i = i + 1) begin
            		for (j = 0; j < 16; j = j + 1) begin
                		for (k = 0; k < 2; k = k + 1) begin
                    			a   = i;
       			                b   = j;
                    			cin = k;
                    			#1; 

                    			$display("\n===== t=%d With A = %2d, B = %2d : Actual gate_model value is %2d, Actual dataflow value is %2d, Actual behavioural model value is %2d", $time, a, b, gate_out, data_out, behav_out);
					$display("===== t=%d Actual gate_model carry is %b, Actual dataflow carry is %b, Actual behavioural model carry is %b", $time, gate_carry, data_carry, behav_carry);
                    		end
            		end
		end

	end

endmodule