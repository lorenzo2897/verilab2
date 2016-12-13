# Experiment 3: 10-bit switches to hex

The task was to create a design to display all 10-bit sliding switches as hexadecimal, using three of the 7-segment LED displays.

Expanding upon the code from experiment 2, we linked the second and third 7-segment displays to the appropriate switches, through the hex_to_7seg module.

```verilog
module ex3_top(SW, HEX0, HEX1, HEX2);

	input [9:0] SW;
	output [6:0] HEX0;
	output [6:0] HEX1;
	output [6:0] HEX2;

	hex_to_7seg SEG0(HEX0, SW[3:0]);
	hex_to_7seg SEG1(HEX1, SW[7:4]);
	hex_to_7seg SEG2(HEX2, {2'b0, SW[9:8]});

endmodule
```

### Testing the design

The design worked as expected on the DE1 board.
