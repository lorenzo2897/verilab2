module clockdiv_50000(clkin, clkout);

	input clkin;
	output clkout;
	
	reg [20:0] count;
	
	initial count = 0;
	
	assign clkout = count==0 ? 1 : 0;
	
	always @(posedge clkin) begin
		count = count + 1;
		if (count == 50000)
			count = 0;
	end

endmodule

