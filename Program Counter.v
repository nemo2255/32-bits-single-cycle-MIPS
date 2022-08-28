module Program_Counter(
input clk,rst,
input [31:0] PC0,
output reg [31:0] PC
);
always@(posedge clk or negedge rst)
  begin
if(!rst)
   PC<=32'h0;
else
   PC<=PC0;
   end
endmodule