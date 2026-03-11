module Control_unit(
	input	wire		clk,
	input	wire		reset,
	input	wire	[5:0]	Opcode,

	output	wire		PCWriteCond,
	output	wire		PCWrite,
	output	wire		IorD,
	output	wire		MemRead,
	output 	wire		MemWrite,
	output	wire		MemReg,
	output	wire 		IRWrite,
	output	wire	[1:0]	PCSource,
	output	wire	[2:0]	ALUOp,
	output	wire		ALUSrcB,
	output	wire	[1:0] 	ALUSrcA,
	output	wire		RegWrite,
	output	wire		RegDst
);


	// ========= OPCODE =========
    parameter RTYPE = 6'b000000;
    parameter LW    = 6'b100011;
    parameter SW    = 6'b101011;
    parameter BEQ   = 6'b000100;

    // ========= STATES =========
    parameter IFETCH  = 3'd0,
              IDECODE = 3'd1,
              EXECUTE = 3'd2,
              MEMREAD = 3'd3,
              MEMWB   = 3'd4,
              MEMWRITE= 3'd5,
              RTWB    = 3'd6;

    reg [2:0] state, next_state;

    // ========= STATE REGISTER =========
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= IFETCH;
        else
            state <= next_state;
    end

    // ========= NEXT STATE LOGIC =========
    always @(*) begin
        case (state)
            IFETCH:  next_state = IDECODE;

            IDECODE: begin
                case (Opcode)
                    LW, SW:  next_state = EXECUTE;
                    RTYPE:   next_state = EXECUTE;
                    BEQ:     next_state = EXECUTE;
                    default: next_state = IFETCH;
                endcase
            end

            EXECUTE: begin
                case (Opcode)
                    LW:     next_state = MEMREAD;
                    SW:     next_state = MEMWRITE;
                    RTYPE:  next_state = RTWB;
                    BEQ:    next_state = IFETCH;
                    default:next_state = IFETCH;
                endcase
            end

            MEMREAD:  next_state = MEMWB;
            MEMWRITE: next_state = IFETCH;
            RTWB:     next_state = IFETCH;
            MEMWB:    next_state = IFETCH;

            default:  next_state = IFETCH;
        endcase
    end

    // ========= OUTPUT LOGIC =========
    always @(*) begin
        // ----- default values (TRÁNH LATCH) -----
        PCWriteCond = 0;
        PCWrite     = 0;
        IorD        = 0;
        MemRead     = 0;
        MemWrite    = 0;
        MemReg      = 0;
        IRWrite     = 0;
        PCSource    = 2'b00;
        ALUOp       = 3'b000;
        ALUSrcA     = 2'b00;
        ALUSrcB     = 0;
        RegWrite    = 0;
        RegDst      = 0;

        case (state)
            // ===== IF =====
            IFETCH: begin
                MemRead  = 1;
                IRWrite  = 1;
                PCWrite  = 1;
                ALUSrcA  = 2'b00;   // PC
                ALUSrcB  = 1;       // +4
                ALUOp    = 3'b000;  // ADD
            end

            // ===== ID =====
            IDECODE: begin
                ALUSrcA = 2'b00;
                ALUSrcB = 1;
                ALUOp   = 3'b000;
            end

            // ===== EX =====
            EXECUTE: begin
                case (Opcode)
                    LW, SW: begin
                        ALUSrcA = 2'b01; // A
                        ALUSrcB = 1;     // imm
                        ALUOp   = 3'b000;
                    end

                    RTYPE: begin
                        ALUSrcA = 2'b01;
                        ALUSrcB = 0;
                        ALUOp   = 3'b010;
                    end

                    BEQ: begin
                        ALUSrcA     = 2'b01;
                        ALUSrcB     = 0;
                        ALUOp       = 3'b001;
                        PCWriteCond = 1;
                        PCSource    = 2'b01;
                    end
                endcase
            end

            // ===== MEM READ =====
            MEMREAD: begin
                MemRead = 1;
                IorD    = 1;
            end

            // ===== MEM WRITE =====
            MEMWRITE: begin
                MemWrite = 1;
                IorD     = 1;
            end

            // ===== WRITE BACK (LW) =====
            MEMWB: begin
                RegWrite = 1;
                MemReg   = 1;
                RegDst   = 0;
            end

            // ===== WRITE BACK (R-TYPE) =====
            RTWB: begin
                RegWrite = 1;
                RegDst   = 1;
                MemReg   = 0;
            end
        endcase
    end
	

endmodule