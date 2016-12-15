library verilog;
use verilog.vl_types.all;
entity clockdiv_50000 is
    port(
        clkin           : in     vl_logic;
        clkout          : out    vl_logic
    );
end clockdiv_50000;
