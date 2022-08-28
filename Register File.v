module Register_File(
input [4:0] A1,A2,A3,
input [31:0] WD3,
input clk,WE3,rst,
output [31:0] RD1,RD2
);
reg [31:0] regfile[0:99];
  integer i;
		always@(posedge clk or negedge rst)
           begin
            if (!rst)
       begin
	      for(i=0;i<100;i=i+1) 
	       begin
	          regfile[i]<=32'b0;
	       end
       end
       else begin
             if (WE3)
	           begin
                 regfile[A3]<=WD3;
             end	          
           end
           end
      assign RD1=regfile[A1] ;
			assign RD2=regfile[A2] ;
endmodule
