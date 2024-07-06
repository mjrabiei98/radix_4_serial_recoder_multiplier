library verilog;
use verilog.vl_types.all;
entity up_counter is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        enable          : in     vl_logic;
        \out\           : out    vl_logic_vector(2 downto 0)
    );
end up_counter;
