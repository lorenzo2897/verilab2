module counter_13 (data_valid, count);

input data_valid;
output [12:0] count;

reg [12:0] count;

always @ (posedge ~data_valid)
begin

	count <= count + 13'b1;
	
end

endmodule