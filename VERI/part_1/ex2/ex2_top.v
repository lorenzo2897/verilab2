module ex2_top(SW, HEX0, HEX1, HEX2, HEX3);

	input [9:0] SW;
	output [6:0] HEX0;
	output [6:0] HEX1;
	output [6:0] HEX2;
	output [6:0] HEX3;

	wire [3:0] D0;
	wire [3:0] D1;
	wire [3:0] D2;
	wire [3:0] D3;

	bin2bcd10 BINBCD(SW, D0, D1, D2, D3);

	hex_to_7seg SEG0(HEX0, D0);
	hex_to_7seg SEG1(HEX1, D1);
	hex_to_7seg SEG2(HEX2, D2);
	hex_to_7seg SEG3(HEX3, D3);

endmodule
