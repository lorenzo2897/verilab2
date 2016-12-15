module ex6_top(
CLOCK_50,
KEY,
HEX0,HEX1,HEX2,HEX3,HEX4);

	input CLOCK_50;
	input [1:0] KEY;
	output [6:0] HEX0;
	output [6:0] HEX1;
	output [6:0] HEX2;
	output [6:0] HEX3;
	output [6:0] HEX4;

	wire [15:0] count;
	
	wire [3:0] BCD_0;
	wire [3:0] BCD_1;
	wire [3:0] BCD_2;
	wire [3:0] BCD_3;
	wire [3:0] BCD_4;
	
	wire counter_en;
	wire clkout;
	
	clockdiv_50000 CLKDIV (CLOCK_50, clkout);
	
	assign counter_en = (~KEY[0]) & clkout;

	counter_16 CTR (CLOCK_50, ~KEY[1], counter_en, count[15:0]);
	
	bin2bcd_16 BCD (count[15:0], BCD_0[3:0], BCD_1[3:0], BCD_2[3:0], BCD_3[3:0], BCD_4[3:0]);
	
	hex_to_7seg H0 (HEX0[6:0], BCD_0[3:0]);
	hex_to_7seg H1 (HEX1[6:0], BCD_1[3:0]);
	hex_to_7seg H2 (HEX2[6:0], BCD_2[3:0]);
	hex_to_7seg H3 (HEX3[6:0], BCD_3[3:0]);
	hex_to_7seg H4 (HEX4[6:0], BCD_4[3:0]);

endmodule
