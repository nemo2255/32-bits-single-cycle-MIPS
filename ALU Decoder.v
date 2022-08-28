module ALU_Decoder(
input [5:0] funct,
input [1:0] ALUOP,
output reg [2:0] ALUcontrol
);
always @(funct or ALUOP)
   begin
     case(ALUOP)
		   2'b00:ALUcontrol=3'b010;
			 2'b01:ALUcontrol=3'b100;
			 2'b10:case(funct)
			   6'b100000:ALUcontrol=3'b010;
				 6'b100010:ALUcontrol=3'b100;
				 6'b101010:ALUcontrol=3'b110;
				 6'b011100:ALUcontrol=3'b101;
				   default:ALUcontrol=3'b010;
			 endcase
		 default:ALUcontrol=3'b010;
	 endcase
	 end
		 
endmodule