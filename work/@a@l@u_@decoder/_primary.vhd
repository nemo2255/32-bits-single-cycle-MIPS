library verilog;
use verilog.vl_types.all;
entity ALU_Decoder is
    port(
        funct           : in     vl_logic_vector(5 downto 0);
        ALUOP           : in     vl_logic_vector(1 downto 0);
        ALUcontrol      : out    vl_logic_vector(2 downto 0)
    );
end ALU_Decoder;
