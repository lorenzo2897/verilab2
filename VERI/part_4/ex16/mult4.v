module processor (sysclk, data_in, data_out);

	input				sysclk;		// system clock
	input [9:0]		data_in;		// 10-bit input data
	output [9:0] 	data_out;	// 10-bit output data

	wire				sysclk;
	wire [9:0]		data_in;
	reg [9:0] 		data_out;
	wire [9:0]		x,y;

	parameter 		ADC_OFFSET = 10'h181;
	parameter 		DAC_OFFSET = 10'h200;

	// decode input
	assign x = data_in[9:0] - ADC_OFFSET;

	// multiply by 4
	assign y = x << 2;

	// encode output
	always @(posedge sysclk)
		data_out <=  y + DAC_OFFSET;

endmodule
