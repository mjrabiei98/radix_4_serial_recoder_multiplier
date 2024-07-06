library verilog;
use verilog.vl_types.all;
entity radix4_recoder is
    generic(
        input_size      : integer := 8
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        x               : in     vl_logic_vector;
        y               : in     vl_logic_vector;
        Recoder_Out     : out    vl_logic_vector;
        done            : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of input_size : constant is 1;
end radix4_recoder;
