library verilog;
use verilog.vl_types.all;
entity Program_Counter is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        PC0             : in     vl_logic_vector(31 downto 0);
        PC              : out    vl_logic_vector(31 downto 0)
    );
end Program_Counter;
