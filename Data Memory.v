module Data_Memory(
input [31:0] A,
input [31:0] WD,
input clk,WE,rst,
output [31:0] RD,
output [15:0] test_value
);
reg [31:0] datamem[0:99];
integer i;
	   always@(posedge clk or negedge rst)
	   begin
	   if(!rst)
       begin
     for(i=0;i<100;i=i+1) 
	          begin
	            datamem[i]<=32'b0;
	       end
	   end
	    else begin
	   if(WE)
	   begin	   
          datamem[A]<=WD;
	   end
	   end
	   end
    assign RD=datamem[A];
    assign	test_value=datamem[0][15:0];
endmodule