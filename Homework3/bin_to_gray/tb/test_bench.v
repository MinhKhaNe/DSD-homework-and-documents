module test_bench;

    reg  [3:0] bin;
    wire [3:0] gate_sum, data_sum, behav_sum;

    bin_to_gray DUT(.*);

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0,test_bench);
        $display("===== Binary to Gray Code Converter =====");
	$monitor("\n===== t=%d With Binary Code = %b =====", $time, bin);

        bin = 4'b0000;
        #1;
        check_result(4'b0000, gate_sum, data_sum, behav_sum);
	
	bin = 4'b0001;
        #1;
        check_result(4'b0001, gate_sum, data_sum, behav_sum);

        bin = 4'b0010; 
        #1;
        check_result(4'b0011, gate_sum, data_sum, behav_sum);

        bin = 4'b0011; 
        #1; 
        check_result(4'b0010, gate_sum, data_sum, behav_sum);

        bin = 4'b0100; 
        #1; 
        check_result(4'b0110, gate_sum, data_sum, behav_sum);

	bin = 4'b0101;
        #1;
        check_result(4'b0111, gate_sum, data_sum, behav_sum);
	
	bin = 4'b0110;
        #1;
        check_result(4'b0101, gate_sum, data_sum, behav_sum);

        bin = 4'b0111; 
        #1;
        check_result(4'b0100, gate_sum, data_sum, behav_sum);

        bin = 4'b1000; 
        #1; 
        check_result(4'b1100, gate_sum, data_sum, behav_sum);

        bin = 4'b1001; 
        #1; 
        check_result(4'b1101, gate_sum, data_sum, behav_sum);

	bin = 4'b1010; 
        #1; 
        check_result(4'b1111, gate_sum, data_sum, behav_sum);

	bin = 4'b1011;
        #1;
        check_result(4'b1110, gate_sum, data_sum, behav_sum);
	
	bin = 4'b1100;
        #1;
        check_result(4'b1010, gate_sum, data_sum, behav_sum);

        bin = 4'b1101; 
        #1;
        check_result(4'b1011, gate_sum, data_sum, behav_sum);

        bin = 4'b1110; 
        #1; 
        check_result(4'b1001, gate_sum, data_sum, behav_sum);

        bin = 4'b1111; 
        #1; 
        check_result(4'b1000, gate_sum, data_sum, behav_sum);

        $finish;
    end

    // ===== Task for checking result =====
    task check_result;
        input [3:0] expected_result;
        input [3:0] e;    
        input [3:0] f;
        input [3:0] g;
    begin
        if(e != expected_result || f != expected_result || g != expected_result) begin
            $display("===== t=%d FAILED, output value does not match =====", $time);
            $display("===== t=%d Expected value is %2d, Actual gate_model value is %2d, Actual dataflow value is %2d, Actual behavioral_model value is %2d =====", $time, expected_result, e, f, g);
        end
        else begin
            $display("===== t=%d PASSED SUCCESSFULLY =====", $time);
        end
    end
    endtask

endmodule
