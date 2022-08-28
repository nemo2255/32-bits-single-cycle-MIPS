module MIPS (
input rst,
input clk,
output [15:0] test_value
);
wire [31:0] PCOUT;
wire [31:0] instruction;
wire [31:0] rdata1,rdata2;
wire [1:0] aluop;
wire memtoreg,memwrite,branch,alusrc,regdst,regwrite,jump;
wire [2:0] alucontrol;
wire [31:0] signextend;
wire [31:0] signshift;
wire [31:0] pcplus4;
wire [31:0] pcbranch;
wire [27:0] shift_address;
wire [31:0] first_pc;
wire [31:0] second_pc;
wire [4:0] writereg;
wire [31:0] second_src;
wire [31:0] aluresult;
wire        zero;
wire [31:0] data;
wire [31:0] lastresult;
//out of IM 
Instruction_memory IM (.PC(PCOUT),.instr(instruction));
// OUT OF RF 
Register_File RF(.A1(instruction[25:21]),.A2(instruction[20:16]),.A3(writereg),.WD3(lastresult),.clk(clk),
.rst(rst),.RD1(rdata1),.RD2(rdata2),.WE3(regwrite));

// OUT OF CONTROLLER
Main_Decoder MD(.opcode(instruction[31:26]),.ALUOP(aluop),.memtoreg(memtoreg),.memwrite(memwrite),.branch(branch),
.ALUsrc(alusrc),.regdst(regdst),.regwrite(regwrite),.jump(jump));

ALU_Decoder AD(.ALUOP(aluop),.funct(instruction[5:0]),.ALUcontrol(alucontrol));

//OUT OF SIGN EXTEND
sign_extend S_E (.instr(instruction[15:0]),.signlmm(signextend));

//OUT OF SHIFT SIGN
shift_left #(.size(32)) SL1(.in(signextend),.out(signshift));

//PC+4
Adder A1 (.A(PCOUT),.B(4),.C(pcplus4));

// PC BRANCH
Adder A2 (.A(signshift),.B(pcplus4),.C(pcbranch));

//SHIFT LEFT
shift_left #(.size(28)) SL2(.in({2'b00,instruction[25:0]}),.out(shift_address));

//PC FIRST MUX
Mux #(.size(32)) M1(.sel(zero&&branch),.in1(pcplus4),.in2(pcbranch),.out(first_pc));

//PC SECOND MUX
Mux #(.size(32)) M2(.sel(jump),.in1(first_pc),.in2({pcplus4[31:28],shift_address}),.out(second_pc));

//PROGRAM COUNTER
Program_Counter PCD(.PC0(second_pc),.clk(clk),.rst(rst),.PC(PCOUT));

//WRITE REG MUX
Mux #(.size(5)) M3(.sel(regdst),.in1(instruction[20:16]),.in2(instruction[15:11]),.out(writereg));

//ALUSRC MUX
Mux #(.size(32)) M4(.sel(alusrc),.in1(rdata2),.in2(signextend),.out(second_src));

//ALU OPERATION
ALU AL1 (.SrcA(rdata1),.SrcB(second_src),.ALUControl(alucontrol),.ALUResult(aluresult),.zero(zero));

//data memory
Data_Memory DM(.A(aluresult),.WD(rdata2),.clk(clk),.WE(memwrite),.rst(rst),.RD(data),.test_value(test_value));

//read data MUX
Mux #(.size(32)) M5 (.sel(memtoreg),.in1(aluresult),.in2(data),.out(lastresult));

endmodule