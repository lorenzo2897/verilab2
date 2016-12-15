module ex10_top(SW, CLOCK_50, DAC_CS, DAC_SDI, DAC_LD, DAC_SCK);

input [9:0] SW;
input CLOCK_50;

output DAC_CS;
output DAC_SDI;
output DAC_LD;
output DAC_SCK;

wire clk_10k;

clockdiv_5000 CLKDIV (CLOCK_50, clk_10k);

spi2dac DAC (CLOCK_50, SW, clk_10k, DAC_SDI, DAC_CS, DAC_SCK, DAC_LD);

endmodule
