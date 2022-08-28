//testbench for MIPS
module MIPS_tb ();

//testbench signal
reg rst_tb;
reg clk_tb;
wire [15:0] test_value_tb;

//initial block
initial begin
    clk_tb=1;
    rst_tb=1;
    #3
    rst_tb=0;
    #2
    rst_tb=1;
    $display("test value is");
    #500
    $display("%d",test_value_tb);
    #5
    $finish;

end
//clk gen
always #5 clk_tb=~clk_tb;

MIPS DUT (.clk(clk_tb),.rst(rst_tb),.test_value(test_value_tb));
    
endmodule

