module Main_Decoder(
input [5:0] opcode,
output reg [1:0] ALUOP,
output reg  memtoreg,memwrite,branch,ALUsrc,regdst,regwrite,jump
);
always@(*)
   begin
     case(opcode)
	     6'b100011:begin
		      jump=1'b0;
			  ALUOP=2'b00;
		      memtoreg=1'b1;
			  memwrite=1'b0;
			  branch=1'b0;
			  ALUsrc=1'b1;
			  regdst=1'b0;
			  regwrite=1'b1;
			  end
		 6'b101011:begin
		      jump=1'b0;
			  ALUOP=2'b00;
		      memtoreg=1'b1;
			  memwrite=1'b1;
			  branch=1'b0;
			  ALUsrc=1'b1;
			  regdst=1'b0;
			  regwrite=1'b0;
			  end
		 6'b000000:begin
		      jump=1'b0;
			  ALUOP=2'b10;
		      memtoreg=1'b0;
			  memwrite=1'b0;
			  branch=1'b0;
			  ALUsrc=1'b0;
			  regdst=1'b1;
			  regwrite=1'b1;
			  end
		 6'b001000:begin
		      jump=1'b0;
			  ALUOP=2'b00;
		      memtoreg=1'b0;
			  memwrite=1'b0;
			  branch=1'b0;
			  ALUsrc=1'b1;
			  regdst=1'b0;
			  regwrite=1'b1;
			  end
		 6'b000100:begin
		      jump=1'b0;
			  ALUOP=2'b01;
		      memtoreg=1'b0;
			  memwrite=1'b0;
			  branch=1'b1;
			  ALUsrc=1'b0;
			  regdst=1'b0;
			  regwrite=1'b0;
			  end
		 6'b000010:begin
		      jump=1'b1;
			  ALUOP=2'b00;
		      memtoreg=1'b0;
			  memwrite=1'b0;
			  branch=1'b0;
			  ALUsrc=1'b0;
			  regdst=1'b0;
			  regwrite=1'b0;
			  end
		 default:begin
		      jump=1'b0;
			  ALUOP=2'b00;
		      memtoreg=1'b0;
			  memwrite=1'b0;
			  branch=1'b0;
			  ALUsrc=1'b0;
			  regdst=1'b0;
			  regwrite=1'b0;
			  end
		endcase
   end
endmodule