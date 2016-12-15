# Experiment 2: Verilog 7-segment display

At this point we transitioned from graphical schematic design to using Verilog to specify our digital circuits. We reproduced the 7-segment display from experiment 1 in Verilog with the following code.

```verilog
module hex_to_7seg(out, in);

	output reg [6:0] out;
	input [3:0] in;

	always @ (*)
		case(in)
			4'h0: out = 7'b1000000;
			4'h1: out = 7'b1111001;
			4'h2: out = 7'b0100100;
			4'h3: out = 7'b0110000;
			4'h4: out = 7'b0011001;
			4'h5: out = 7'b0010010;
			4'h6: out = 7'b0000010;
			4'h7: out = 7'b1111000;
			4'h8: out = 7'b0000000;
			4'h9: out = 7'b0011000;
			4'ha: out = 7'b0001000;
			4'hb: out = 7'b0000011;
			4'hc: out = 7'b1000110;
			4'hd: out = 7'b0100001;
			4'he: out = 7'b0000110;
			4'hf: out = 7'b0001110;
		endcase

endmodule
```

### Pin assignment

Instead of manually assigning pins through the Pin Planner, we discovered it was possible to achieve the same result by pasting a list of pin assignments in text format in the .qsf file of the project. Pin assignments looked something like this

```
#============================================================
# HEX0
#============================================================
set_location_assignment PIN_AE26 -to HEX0[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX0[0]
```
Being able to re-use pin assignments in every project instead of having to assign everything by hand was a big time saver.

### Testing the design

We used the code provided in the lab booklet for the top-level file `ex2_top.v`, instead of a graphical schematic.

```verilog
module ex2_top(SW, HEX0);
	input [3:0] SW;
	output [6:0] HEX0;
	
	hex_to_7seg SEG0 (HEX0, SW);
endmodule
```

We tested the new Verilog design on the FPGA and it worked as expected.
