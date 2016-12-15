module ex11_top(SW, CLOCK_50, DAC_CS, DAC_SDI, DAC_LD, DAC_SCK, PWM_OUT);

	input [9:0] SW;
	input CLOCK_50;

	output DAC_CS;
	output DAC_SDI;
	output DAC_LD;
	output DAC_SCK;

	output PWM_OUT;

	wire clk_10k;
	reg [9:0] SW_in;

	always@(posedge CLOCK_50)
		SW_in <= SW;

	clockdiv_5000 CLKDIV (CLOCK_50, clk_10k);

	spi2dac DAC (CLOCK_50, SW_in, clk_10k, DAC_SDI, DAC_CS, DAC_SCK, DAC_LD);

	pwm PWM (CLOCK_50, SW_in, clk_10k, PWM_OUT);

endmodule
