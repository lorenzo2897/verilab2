module sw2_7seg(SW, HEX0, HEX1, HEX2, HEX3);

input [8:0] SW;

output [6:0] HEX0, HEX1, HEX2, HEX3;

wire [19:0] mult_delay;

wire [3:0] BCD0, BCD1, BCD2, BCD3;



multiply_k multiple_h666 (SW, mult_delay);
bin2bcd10 bin2bcd (mult_delay[19:10], BCD0, BCD1, BCD2, BCD3);

hex_to_7seg hex0 (HEX0, BCD0);
hex_to_7seg hex1 (HEX1, BCD1);
hex_to_7seg hex2 (HEX2, BCD2);
hex_to_7seg hex3 (HEX3, BCD3);

endmodule