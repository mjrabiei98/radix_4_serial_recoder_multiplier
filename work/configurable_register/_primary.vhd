library verilog;
use verilog.vl_types.all;
entity configurable_register is
    generic(
        SIZE            : integer := 8
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        d               : in     vl_logic_vector;
        load            : in     vl_logic;
        q               : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of SIZE : constant is 1;
end configurable_register;
