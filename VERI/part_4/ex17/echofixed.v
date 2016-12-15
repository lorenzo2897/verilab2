module processor (sysclk, data_in, data_out, data_valid, sw);

	input				sysclk;		// system clock
	input [9:0]		data_in;		// 10-bit input data
	output [9:0] 	data_out;	// 10-bit output data
	input				data_valid;	// data is valid?
	input	[9:0]		sw;

	wire				sysclk;
	wire [9:0]		data_in;
	reg [9:0] 		data_out;
	wire [9:0]		x, y;
	
	wire				fifo_full;
	wire	[9:0]		fifo_out;
	wire				valid_pulse;
	reg				valid_delayed;

	parameter 		ADC_OFFSET = 10'h181;
	parameter 		DAC_OFFSET = 10'h200;

	// decode input
	assign x = data_in[9:0] - ADC_OFFSET;

	// processor
	// ---------

	pulse_gen VALID_PULSER (valid_pulse, data_valid, sysclk);

	always @(posedge sysclk) begin
		valid_delayed <= valid_pulse;
	end

	fifo BUFFER (sysclk, y, fifo_full & valid_delayed, valid_pulse, fifo_full, fifo_out);

	assign y = x - {fifo_out[9], fifo_out[9:1]};

	// --------

	// encode output
	always @(posedge sysclk)
		data_out <=  y + DAC_OFFSET;

endmodule
