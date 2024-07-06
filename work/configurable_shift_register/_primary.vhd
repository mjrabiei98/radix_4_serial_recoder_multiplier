library verilog;
use verilog.vl_types.all;
entity configurable_shift_register is
    generic(
        SIZE            : integer := 8;
        shift_size      : integer := 2
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        d               : in     vl_logic_vector;
        load            : in     vl_logic;
        shift           : in     vl_logic;
        q               : out    vl_logic_vector;
        shift_out       : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of SIZE : constant is 1;
    attribute mti_svvh_generic_type of shift_size : constant is 1;
end configurable_shift_register;
