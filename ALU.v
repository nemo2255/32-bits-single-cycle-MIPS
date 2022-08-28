module ALU (
input  [31:0] SrcA,SrcB,
input  [2:0] ALUControl,
output reg zero,
output reg [31:0] ALUResult
);
reg [31:0] RESULT;
always @(*)
begin
case(ALUControl)
3'b000:RESULT=SrcA&SrcB;
3'b001:RESULT=SrcA|SrcB;
3'b010:RESULT=SrcA+SrcB;
3'b100:RESULT=SrcA-SrcB;
3'b101:RESULT=SrcA*SrcB;
3'b110:RESULT=(SrcA<SrcB)? 32'b1:32'b0;
default:RESULT=32'hffff0000;
endcase
ALUResult=RESULT;
zero=(RESULT==32'b0) ? 1'b1:1'b0;
end
endmodule
