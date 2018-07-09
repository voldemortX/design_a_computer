
module controller(
    input clk,reset,
    input [5:0] op,funct,
    input zero,
    output pcen,
    output reg MEMR,MEMW,RegWrite,IorD,IRWrite,
    output reg [2:0] ALUCon,
    output reg [1:0] PCsrc,Regsrc,ALUsrca,ALUsrcb,RegDst
    );
    reg [3:0] state, nextstate;
    reg PCWC1,PCWC2,PCW;
    parameter ADD = 6'b100000;
    parameter OR = 6'b100101;
    parameter SLL = 6'b000000;
    parameter SRL = 6'b000010;
    parameter JR = 6'b001000;
    parameter ADDI = 6'b001000;
    parameter ANDI = 6'b001100;
    parameter XORI = 6'b001110;
    parameter BNE = 6'b000101;
    parameter BEQ = 6'b000100;
    parameter SW = 6'b101011;
    parameter LW = 6'b100011;
    parameter J = 6'b000010;
    parameter JAL = 6'b000011;
    
    parameter FETCH = 4'b0000;
    parameter DECODE = 4'b0001;
    parameter MEMACOM = 4'b0010;
    parameter MEMACR = 4'b0011;
    parameter MEMACW = 4'b0100;
    parameter MEMRCOM = 4'b0101;
    parameter REXE = 4'b0110;
    parameter RCOM = 4'b0111;
    parameter SHIFTEXE = 4'b1000;
    parameter IEXE = 4'b1001;
    parameter ICOM = 4'b1010;
    parameter BRANCHCOM = 4'b1011;
    parameter JUMPCOM = 4'b1100;
    
    always @(posedge clk)
        if(reset) state <= FETCH;
        else state <= nextstate;
    
    always @(*)
    begin
        case(state)
            FETCH: nextstate<=DECODE;
            DECODE:     case(op)
                            LW:   nextstate <= MEMACOM;
                            SW:   nextstate <= MEMACOM;
                            J:    nextstate <= JUMPCOM;
                            JAL:  nextstate <= JUMPCOM;
                            ADDI: nextstate <= IEXE;
                            ANDI: nextstate <= IEXE;
                            XORI: nextstate <= IEXE;
                            BNE:  nextstate <= BRANCHCOM;
                            BEQ:  nextstate <= BRANCHCOM;
                            6'b000000:  case(funct)
                                            ADD: nextstate <= REXE;
                                            OR:  nextstate <= REXE;
                                            SLL: nextstate <= SHIFTEXE;
                                            SRL: nextstate <= SHIFTEXE;
                                            JR:  nextstate <= JUMPCOM;
                                        endcase
                            default: nextstate <= FETCH;
                        endcase
            MEMACOM:    case(op)
                            LW:   nextstate <= MEMACR;
                            SW:   nextstate <= MEMACW;
                            default: nextstate <= FETCH;
                        endcase
            MEMACR:     nextstate <= MEMRCOM;
            REXE:       nextstate <= RCOM;
            SHIFTEXE:   nextstate <= RCOM;
            IEXE:       nextstate <= ICOM;
            MEMRCOM:    nextstate <= FETCH;
            MEMACW:     nextstate <= FETCH;
            RCOM:       nextstate <= FETCH;
            ICOM:       nextstate <= FETCH;
            BRANCHCOM:  nextstate <= FETCH;
            JUMPCOM:    nextstate <= FETCH;
            default:    nextstate <= FETCH;
        endcase
    end
    
    always @(*)
    begin
        MEMR <= 0; MEMW <= 0; PCWC1 <= 0; PCWC2 <= 0; PCW <= 0; RegWrite <= 0; IorD <= 0; IRWrite <= 0;
        ALUCon <= 3'b000;
        PCsrc <= 2'b00; Regsrc <= 2'b00; ALUsrca <= 2'b00; ALUsrcb <= 2'b00; RegDst <= 2'b00;
        case(state)
            FETCH:
                begin
                    PCsrc <= 2'b10;
                    PCW <= 1;
                    ALUsrcb <= 2'b10;
                    MEMR <= 1;
                    IRWrite <= 1;
                end
            DECODE:
                begin
                    ALUsrcb <= 2'b01;
                end
            MEMACOM:    
                begin
                    ALUsrca <= 2'b01;
                    ALUsrcb <= 2'b01;
                end
            MEMACR:  
                begin
                    MEMR <= 1;
                    IorD <= 1;
                end
            REXE:    
                begin
                    ALUsrca <= 2'b01;
                    if (funct==OR) ALUCon <= 3'b101;
                end
            SHIFTEXE:  
                begin
                    ALUsrca <= 2'b10;
                    if (funct==SLL) ALUCon <= 3'b001;
                    else ALUCon <= 3'b010;
                end
            IEXE:  
                begin
                    ALUsrca <= 2'b01;
                    ALUsrcb <= 2'b01;
                    case(op)
                        ADDI: ALUCon <= 3'b000;
                        ANDI: ALUCon <= 3'b100;
                        XORI: ALUCon <= 3'b011;
                    endcase
                end
            MEMRCOM:  
                begin
                    RegWrite <= 1;
                    IorD <= 1;
                end
            MEMACW: 
                begin
                    MEMW <= 1;
                    IorD <= 1;
                end
            RCOM:     
                begin
                    RegDst <= 2'b01;
                    Regsrc <= 2'b10;
                    RegWrite <= 1;
                end
            ICOM:     
                begin
                    Regsrc <= 2'b10;
                    RegWrite <= 1;
                end
            BRANCHCOM: 
                begin
                    ALUCon <= 3'b110;
                    PCsrc <= 2'b11;
                    ALUsrca <= 2'b01;
                    if (op==BEQ) PCWC1 <= 1;
                    else PCWC2 <= 1;
                end
            JUMPCOM: 
                begin
                    PCW <= 1;
                    RegDst <= 2'b10;
                    Regsrc <= 2'b01;
                    if(op != 6'b000000)  // jr 
                    begin
                        PCsrc <= 2'b01;
                    end
                    
                    if(op == JAL)
                    begin
                        RegWrite <= 1;
                    end
                end
        endcase
    end
    assign pcen = PCW | (PCWC1 & zero) | (PCWC2 & ~zero);
endmodule
