module Mux #(parameter size=32) (
input [size-1:0] in1,in2,
output [size-1:0] out,
input sel
);
assign out=(sel)? in2:in1;
endmodule