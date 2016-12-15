module processor19 (CLOCK_50, data_in, data_out, data_valid, SW, HEX0, HEX1, HEX2, HEX3);

	input [8:0] SW;
	input [9:0] data_in;
	input CLOCK_50;
	input [9:0] data_valid;

	output [9:0] data_out;
	output [6:0] HEX0, HEX1, HEX2, HEX3;


	wire [12:0] rd_addr;
	wire [12:0] wd_addr;
	wire [9:0] x, y;
	wire signed [8:0] q;

	reg [9:0] data_out;

	// select where to write the values into, w.r.t. the read address
	assign wd_addr = {SW[8:0],1'b0,1'b0,1'b0,1'b0} + rd_addr;

	// coutner to loop throug the RAM addresses
	counter_13 counter13 (data_valid, rd_addr);

	// pulse to enable read/write of RAM
	pulse_gen pulse(enable, data_valid, CLOCK_50);

	// the RAM holds our sound samples
	RAM19 ram0 (CLOCK_50,  y[9:1], rd_addr, enable, wd_addr, enable, q[8:0]);

	// the 7-seg displays show the echo delay
	sw2_7seg out_sw2_7seg (SW, HEX0, HEX1, HEX2, HEX3);


	parameter ADC_OFFSET = 10'h181;
	parameter DAC_OFFSET = 10'h200;

	// decode input
	assign x[9:0] = data_in - ADC_OFFSET;

	// construct echo using data from RAM
	assign y[9:0] = x - {q[8], q[8:0]};

	// encode output
	always @ (posedge CLOCK_50)
		data_out <= y[9:0] + DAC_OFFSET;

endmodule
