library verilog;
use verilog.vl_types.all;
entity ALU is
    port(
        SrcA            : in     vl_logic_vector(31 downto 0);
        SrcB            : in     vl_logic_vector(31 downto 0);
        ALUControl      : in     vl_logic_vector(2 downto 0);
        zero            : out    vl_logic;
        ALUResult       : out    vl_logic_vector(31 downto 0)
    );
end ALU;
