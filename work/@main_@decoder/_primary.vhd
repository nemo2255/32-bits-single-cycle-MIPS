library verilog;
use verilog.vl_types.all;
entity Main_Decoder is
    port(
        opcode          : in     vl_logic_vector(5 downto 0);
        ALUOP           : out    vl_logic_vector(1 downto 0);
        memtoreg        : out    vl_logic;
        memwrite        : out    vl_logic;
        branch          : out    vl_logic;
        ALUsrc          : out    vl_logic;
        regdst          : out    vl_logic;
        regwrite        : out    vl_logic;
        jump            : out    vl_logic
    );
end Main_Decoder;
