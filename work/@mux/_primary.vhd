library verilog;
use verilog.vl_types.all;
entity Mux is
    generic(
        size            : integer := 32
    );
    port(
        in1             : in     vl_logic_vector;
        in2             : in     vl_logic_vector;
        \out\           : out    vl_logic_vector;
        sel             : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of size : constant is 1;
end Mux;
