library verilog;
use verilog.vl_types.all;
entity shift_left is
    generic(
        size            : integer := 32
    );
    port(
        \in\            : in     vl_logic_vector;
        \out\           : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of size : constant is 1;
end shift_left;
