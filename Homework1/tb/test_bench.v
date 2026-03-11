module test_bench;

	reg	a,b;
	wire	and_out, or_out, i_out, buffer_out;
	wire	nand_out, nor_out, xor_out, xnor_out;

	homework DUT(.*);

	initial begin
		$dumpfile("wave.vcd");     
        	$dumpvars(0, test_bench);  
		$display("===== Four cases of each logic gates =====");
		$monitor($time, ,"===== With A = %b, B= %b: AND = %b, OR = %b, I = %b, BUFFER = %b, NAND = %b, NOR = %b, XOR = %b, XNOR = %b =====",a, b ,and_out, or_out, i_out, buffer_out,nand_out, nor_out, xor_out, xnor_out);
		a=0; b=0;
		#1;
	        a=0; b=1;
		#1;
	        a=1; b=0;    
		#1;
    	  	a=1; b=1;
		#1;
    		$finish;
	end

endmodule