module jk_ff(
	input	wire	clk,
	input	wire	rst_n,
	input	wire	J,
	input	wire	J,
	output	reg	Q
);

	always @(posedge clk or negedge rst_n) begin
		case ({J, K})
            		2'b00: Q <= Q;    
            		2'b01: Q <= 0;    
            		2'b10: Q <= 1;    
            		2'b11: Q <= ~Q;   
        	endcase
	end		

endmodule

