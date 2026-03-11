module test_bench15;

    reg  [3:0] a, b;
    reg        cin;
    wire [3:0] gate_sum, data_sum, behav_sum;
    wire       gate_carry, data_carry, behav_carry;

    cla_adder_4bit DUT(.*);

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0,test_bench15);
        $display("===== 4-bit Carry Look Ahead Adder Testbench =====");

        a = 4'b0000; b = 4'b0000; cin = 0; 
        #1;
        check_result(4'b0000, gate_sum, data_sum, behav_sum);
        check_carry(0, gate_carry, data_carry, behav_carry);

	#1;
        a = 4'b0011; b = 4'b0101; cin = 0; 
        #1;
        check_result(4'b1000, gate_sum, data_sum, behav_sum);
        check_carry(0, gate_carry, data_carry, behav_carry);

        a = 4'b1111; b = 4'b0001; cin = 0; 
        #1; 
        check_result(4'b0000, gate_sum, data_sum, behav_sum);
        check_carry(1, gate_carry, data_carry, behav_carry);

        a = 4'b1010; b = 4'b0110; cin = 1; 
        #1; 
        check_result(4'b0001, gate_sum, data_sum, behav_sum);
        check_carry(1, gate_carry, data_carry, behav_carry);

        a = 4'b1111; b = 4'b1111; cin = 0; 
        #1;
        check_result(4'b1110, gate_sum, data_sum, behav_sum);
        check_carry(1, gate_carry, data_carry, behav_carry);

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

    // ===== Task for checking carry =====
    task check_carry;
        input expected_carry;
        input i;    
        input j;
        input k;
    begin
        if(i != expected_carry || j != expected_carry || k != expected_carry) begin
            $display("===== t=%d FAILED, output carry does not match =====", $time);
            $display("===== t=%d Expected value is %b, Actual gate_model value is %b, Actual dataflow value is %b, Actual behavioral_model value is %b =====", $time, expected_carry, i, j, k);
        end
        else begin
            $display("===== t=%d PASSED SUCCESSFULLY =====", $time);
        end
    end
    endtask

endmodule
