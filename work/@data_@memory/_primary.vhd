library verilog;
use verilog.vl_types.all;
entity Data_Memory is
    port(
        A               : in     vl_logic_vector(31 downto 0);
        WD              : in     vl_logic_vector(31 downto 0);
        clk             : in     vl_logic;
        WE              : in     vl_logic;
        rst             : in     vl_logic;
        RD              : out    vl_logic_vector(31 downto 0);
        test_value      : out    vl_logic_vector(15 downto 0)
    );
end Data_Memory;
