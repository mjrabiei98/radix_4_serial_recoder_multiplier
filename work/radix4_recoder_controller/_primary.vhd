library verilog;
use verilog.vl_types.all;
entity radix4_recoder_controller is
    generic(
        LD_stage        : vl_logic_vector(1 downto 0) := (Hi0, Hi0);
        Recode_stage    : vl_logic_vector(1 downto 0) := (Hi0, Hi1);
        Finish_Stage    : vl_logic_vector(1 downto 0) := (Hi1, Hi0)
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        cnt             : in     vl_logic_vector(2 downto 0);
        load_x          : out    vl_logic;
        load_y          : out    vl_logic;
        shift_y         : out    vl_logic;
        load_c          : out    vl_logic;
        load_xy_reg     : out    vl_logic;
        load_rec_reg    : out    vl_logic;
        load_xy         : out    vl_logic;
        count_en        : out    vl_logic;
        done            : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of LD_stage : constant is 2;
    attribute mti_svvh_generic_type of Recode_stage : constant is 2;
    attribute mti_svvh_generic_type of Finish_Stage : constant is 2;
end radix4_recoder_controller;
