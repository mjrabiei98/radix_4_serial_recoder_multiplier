library verilog;
use verilog.vl_types.all;
entity radix4_recoder_dp is
    generic(
        input_size      : integer := 8
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        x               : in     vl_logic_vector;
        y               : in     vl_logic_vector;
        load_x          : in     vl_logic;
        load_y          : in     vl_logic;
        shift_y         : in     vl_logic;
        load_c          : in     vl_logic;
        load_xy_reg     : in     vl_logic;
        load_rec_reg    : in     vl_logic;
        load_xy         : in     vl_logic;
        count_en        : in     vl_logic;
        cnt             : out    vl_logic_vector(2 downto 0);
        \out\           : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of input_size : constant is 1;
end radix4_recoder_dp;
