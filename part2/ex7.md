# Experiment 7: Shift register and PRBS

We calculated by hand the first 10 results of a LFSR implementing the polynomial **1 + X + X<sup>7</sup>**

Q7	|	Q6	|	Q5	|	Q4	|	Q3	|	Q2	|	Q1	|	count
---	|	---	|	---	|	---	|	---	|	---	|	---	|	---
0	|	0	|	0	|	0	|	0	|	0	|	1	|	1
0	|	0	|	0	|	0	|	0	|	1	|	1	|	3
0	|	0	|	0	|	0	|	1	|	1	|	1	|	7
0	|	0	|	0	|	1	|	1	|	1	|	1	|	15
0	|	0	|	1	|	1	|	1	|	1	|	1	|	31
0	|	1	|	1	|	1	|	1	|	1	|	1	|	63
1	|	1	|	1	|	1	|	1	|	1	|	1	|	127
1	|	1	|	1	|	1	|	1	|	1	|	0	|	126
1	|	1	|	1	|	1	|	1	|	0	|	1	|	125
1	|	1	|	1	|	1	|	0	|	1	|	0	|	122

This equates to the logic equation `Q1' = Q1 xor Q7`.

We implemented it in Verilog:

```verilog
module lfsr7 (data_out, clk);

	output[7:1] data_out;
	input clk;

	reg[7:1] sreg;
	
	initial sreg = 1;

	always @ (posedge clk)
		sreg <= {sreg[6:1] , sreg[7] ^ sreg[1]};

	assign data_out = sreg;

endmodule
```

And we wired it to the push buttons to test in on the DE1.

```verilog
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
```
