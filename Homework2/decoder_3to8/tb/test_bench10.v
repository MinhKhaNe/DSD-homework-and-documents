module test_bench10;

    reg [2:0] s;
    wire [7:0] gate_out, data_out, behav_out;

    decoder_3to8 DUT(.*);

    initial begin
        $dumpfile("wave10.vcd");
        $dumpvars(0,test_bench10);
        $display("===== Test 3 to 8 Decoder =====");

        s = 3'b000; 
	#1;
        $display("===== S = 3'b000 =====");
        if(gate_out!=8'b0000_0001 || data_out!=8'b0000_0001 || behav_out!=8'b0000_0001) begin
            $display("===== t=%d FAILED, value does not match =====", $time);
            $display("===== t=%d Expected=0000_0001, Gate=%b, Data=%b, Behavioral=%b =====", $time, gate_out, data_out, behav_out);
        end else begin
            $display("===== t=%d PASSED SUCCESSFULLY =====", $time);
        end

        s = 3'b001; 
	#1;
        $display("===== S = 3'b001 =====");
        if(gate_out!=8'b0000_0010 || data_out!=8'b0000_0010 || behav_out!=8'b0000_0010) begin
            $display("===== t=%d FAILED, value does not match =====", $time);
            $display("===== t=%d Expected=0000_0010, Gate=%b, Data=%b, Behavioral=%b =====", $time, gate_out, data_out, behav_out);
        end else begin
            $display("===== t=%d PASSED SUCCESSFULLY =====", $time);
        end

        s = 3'b010; 
	#1;
        $display("===== S = 3'b010 =====");
        if(gate_out!=8'b0000_0100 || data_out!=8'b0000_0100 || behav_out!=8'b0000_0100) begin
            $display("===== t=%d FAILED, value does not match =====", $time);
            $display("===== t=%d Expected=0000_0100, Gate=%b, Data=%b, Behavioral=%b =====", $time, gate_out, data_out, behav_out);
        end else begin
            $display("===== t=%d PASSED SUCCESSFULLY =====", $time);
        end

        s = 3'b011; 
	#1;
        $display("===== S = 3'b011 =====");
        if(gate_out!=8'b0000_1000 || data_out!=8'b0000_1000 || behav_out!=8'b0000_1000) begin
            $display("===== t=%d FAILED, value does not match =====", $time);
            $display("===== t=%d Expected=0001_0000, Gate=%b, Data=%b, Behavioral=%b =====", $time, gate_out, data_out, behav_out);
        end else begin
            $display("===== t=%d PASSED SUCCESSFULLY =====", $time);
        end

	s = 3'b100; 
	#1;
        $display("===== S = 3'b100 =====");
        if(gate_out!=8'b0001_0000 || data_out!=8'b0001_0000 || behav_out!=8'b0001_0000) begin
            $display("===== t=%d FAILED, value does not match =====", $time);
            $display("===== t=%d Expected=0001_0000, Gate=%b, Data=%b, Behavioral=%b =====", $time, gate_out, data_out, behav_out);
        end else begin
            $display("===== t=%d PASSED SUCCESSFULLY =====", $time);
        end

        s = 3'b101; 
	#1;
        $display("===== S = 3'b101 =====");
        if(gate_out!=8'b0010_0000 || data_out!=8'b0010_0000 || behav_out!=8'b0010_0000) begin
            $display("===== t=%d FAILED, value does not match =====", $time);
            $display("===== t=%d Expected=0010_0000, Gate=%b, Data=%b, Behavioral=%b =====", $time, gate_out, data_out, behav_out);
        end else begin
            $display("===== t=%d PASSED SUCCESSFULLY =====", $time);
        end

        s = 3'b110; 
	#1;
        $display("===== S = 3'b110 =====");
        if(gate_out!=8'b0100_0000 || data_out!=8'b0100_0000 || behav_out!=8'b0100_0000) begin
            $display("===== t=%d FAILED, value does not match =====", $time);
            $display("===== t=%d Expected=0100_0000, Gate=%b, Data=%b, Behavioral=%b =====", $time, gate_out, data_out, behav_out);
        end else begin
            $display("===== t=%d PASSED SUCCESSFULLY =====", $time);
        end

        s = 3'b111; 
	#1;
        $display("===== S = 3'b111 =====");
        if(gate_out!=8'b1000_0000 || data_out!=8'b1000_0000 || behav_out!=8'b1000_0000) begin
            $display("===== t=%d FAILED, value does not match =====", $time);
            $display("===== t=%d Expected=1000_0000, Gate=%b, Data=%b, Behavioral=%b =====", $time, gate_out, data_out, behav_out);
        end else begin
            $display("===== t=%d PASSED SUCCESSFULLY =====", $time);
        end

        #1;
        $finish;
    end

endmodule
