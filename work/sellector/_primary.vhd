library verilog;
use verilog.vl_types.all;
entity sellector is
    generic(
        input_size      : integer := 8
    );
    port(
        x               : in     vl_logic_vector;
        xbar            : in     vl_logic_vector;
        x_2             : in     vl_logic_vector;
        one             : in     vl_logic;
        neg             : in     vl_logic;
        zero            : in     vl_logic;
        \out\           : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of input_size : constant is 1;
end sellector;
