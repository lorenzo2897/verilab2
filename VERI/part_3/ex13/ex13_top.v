module ex13_top(CLOCK_50, DAC_CS, DAC_SDI, DAC_LD, DAC_SCK, PWM_OUT);

	
input CLOCK_50;

output DAC_CS;
output DAC_SDI;
output DAC_LD;
output DAC_SCK;
output PWM_OUT;

wire [9:0] A;
wire [9:0] D;
wire clock_10k;

clockdiv_5000 div5000 (CLOCK_50, clock_10k);

counter_10 c_10(CLOCK_50, 1'b0, clock_10k, A);

rom_10 rom(A, clock_10k, D);

spi2dac(CLOCK_50, D, clock_10k, DAC_SDI, DAC_CS, DAC_SCK, DAC_LD);


endmodule

