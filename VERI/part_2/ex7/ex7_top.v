module ex7_top(
KEY,
HEX0,HEX1,HEX2,HEX3,HEX4);

	input [3:0] KEY;
	output [6:0] HEX0;
	output [6:0] HEX1;
	output [6:0] HEX2;
	output [6:0] HEX3;
	output [6:0] HEX4;
	
	wire [3:0] BCD_0;
	wire [3:0] BCD_1;
	wire [3:0] BCD_2;
	wire [3:0] BCD_3;
	wire [3:0] BCD_4;
	
	wire [6:0] shiftout;

	lfsr7 SHIFTREG (shiftout[6:0], ~KEY[3]);
	
	bin2bcd_16 BCD (shiftout[6:0], BCD_0[3:0], BCD_1[3:0], BCD_2[3:0], BCD_3[3:0], BCD_4[3:0]);
	
	hex_to_7seg H0 (HEX0[6:0], BCD_0[3:0]);
	hex_to_7seg H1 (HEX1[6:0], BCD_1[3:0]);
	hex_to_7seg H2 (HEX2[6:0], BCD_2[3:0]);
	hex_to_7seg H3 (HEX3[6:0], BCD_3[3:0]);
	hex_to_7seg H4 (HEX4[6:0], BCD_4[3:0]);

endmodule
