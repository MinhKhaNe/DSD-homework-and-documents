module test_bench16;

    reg 	a, b, c;
    wire  	gate_out, data_out, behav_out;

    majority_circuit DUT(.*);

    initial begin
        $dumpfile("wave16.vcd");
        $dumpvars(0,test_bench16);
        $display("===== Majority Circuit Testbench =====");
	$monitor("===== With A = %b, B = %b, C = %b =====", a, b, c);
        a = 0; b = 0; c = 0; 
        #1;
        check_result(0, gate_out, data_out, behav_out);

	a = 0; b = 0; c = 1; 
        #1;
        check_result(0, gate_out, data_out, behav_out);

	a = 0; b = 1; c = 0; 
        #1;
        check_result(0, gate_out, data_out, behav_out);

	a = 1; b = 0; c = 0; 
        #1;
        check_result(0, gate_out, data_out, behav_out);

	a = 0; b = 1; c = 1; 
        #1;
        check_result(1, gate_out, data_out, behav_out);

	a = 1; b = 0; c = 1; 
        #1;
        check_result(1, gate_out, data_out, behav_out);
	
	a = 1; b = 1; c = 0; 
        #1;
        check_result(1, gate_out, data_out, behav_out);

	a = 1; b = 1; c = 1; 
        #1;
        check_result(1, gate_out, data_out, behav_out);

        $finish;
    end

    // ===== Task for checking result =====
    task check_result;
        input 	expected_result;
        input 	e;    
        input 	f;
        input	g;
    begin
        if(e != expected_result || f != expected_result || g != expected_result) begin
            $display("===== t=%d FAILED, output value does not match =====", $time);
            $display("===== t=%d Expected value is %b, Actual gate_model value is %b, Actual dataflow value is %b, Actual behavioral_model value is %b =====", $time, expected_result, e, f, g);
        end
        else begin
            $display("===== t=%d PASSED SUCCESSFULLY =====", $time);
        end
    end
    endtask

endmodule
