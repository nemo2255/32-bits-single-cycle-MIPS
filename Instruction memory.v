module Instruction_memory (
input  [31:0] PC,
output [31:0] instr
);
reg [31:0] mem[0:99];
initial  
  begin
     $readmemh("Program3.txt",mem);
  end
  
assign instr=mem[PC/4];
endmodule