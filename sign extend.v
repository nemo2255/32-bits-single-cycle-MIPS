module sign_extend (
input [15:0] instr,
output  [31:0] signlmm
);
assign signlmm={{16{instr[15]}},instr};
endmodule