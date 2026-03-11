module test_bench11;

    reg [1:0] s;
    wire [3:0] gate_out, data_out, behav_out;

    decoder_2to4 DUT(.*);

    initial begin
        $dumpfile("wave11.vcd");
        $dumpvars(0,test_bench11);
        $display("===== Test 2 to 4 Decoder =====");


        s = 2'b00; 
	#1;
        $display("===== S = 2'b00 =====");
        if(gate_out!=4'b0001 || data_out!=4'b0001 || behav_out!=4'b0001) begin
            $display("===== t=%d FAILED, value does not match =====", $time);
            $display("===== t=%d Expected=0001, Gate=%b, Data=%b, Behav=%b =====", $time, gate_out, data_out, behav_out);
        end else begin
            $display("===== t=%d PASSED SUCCESSFULLY =====", $time);
        end

        s = 2'b01; 
	#1;
        $display("===== S = 2'b01 =====");
        if(gate_out!=4'b0010 || data_out!=4'b0010 || behav_out!=4'b0010) begin
            $display("===== t=%d FAILED, value does not match =====", $time);
            $display("===== t=%d Expected=0010, Gate=%b, Data=%b, Behav=%b =====", $time, gate_out, data_out, behav_out);
        end else begin
            $display("===== t=%d PASSED SUCCESSFULLY =====", $time);
        end

        s = 2'b10; 
	#1;
        $display("===== S = 2'b10 =====");
        if(gate_out!=4'b0100 || data_out!=4'b0100 || behav_out!=4'b0100) begin
            $display("===== t=%d FAILED, value does not match =====", $time);
            $display("===== t=%d Expected=0100, Gate=%b, Data=%b, Behav=%b =====", $time, gate_out, data_out, behav_out);
        end else begin
            $display("===== t=%d PASSED SUCCESSFULLY =====", $time);
        end

        s = 2'b11; 
	#1;
        $display("===== S = 2'b11 =====");
        if(gate_out!=4'b1000 || data_out!=4'b1000 || behav_out!=4'b1000) begin
            $display("===== t=%d FAILED, value does not match =====", $time);
            $display("===== t=%d Expected=1000, Gate=%b, Data=%b, Behav=%b =====", $time, gate_out, data_out, behav_out);
        end else begin
            $display("===== t=%d PASSED SUCCESSFULLY =====", $time);
        end

        #1;
        $finish;
    end

endmodule
