library verilog;
use verilog.vl_types.all;
entity add3_ge5 is
    port(
        iW              : in     vl_logic_vector(3 downto 0);
        oA              : out    vl_logic_vector(3 downto 0)
    );
end add3_ge5;
