library verilog;
use verilog.vl_types.all;
entity MIPS is
    port(
        rst             : in     vl_logic;
        clk             : in     vl_logic;
        test_value      : out    vl_logic_vector(15 downto 0)
    );
end MIPS;
