module ex12_top(CLOCK_50, SW, HEX0, HEX1, HEX2);

	input CLOCK_50;
	input [9:0] SW;
	
	output [6:0] HEX0;
	output [6:0] HEX1;
	output [6:0] HEX2;
	
	wire [9:0] rom_out;
	
	rom10 ROM (SW, CLOCK_50, rom_out);
	
	hex_to_7seg H1 (HEX0, rom_out[3:0]);
	hex_to_7seg H2 (HEX1, rom_out[7:4]);
	hex_to_7seg H3 (HEX2, rom_out[9:8]);

endmodule

