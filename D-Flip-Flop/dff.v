
module d_latch(
	input d,
	input clk,
	output reg q
);
	always @(*) begin
		if (clk)
			q = d; // transparent latch
	end
endmodule

module d_ff(
	input d,
	input clk,
	output q
);
	// edge triggered latch 
	// for storing 1 bit at a time 
	// rising edge driver
		
	wire d1;
	
	d_latch dl_1(
		.d(d),
		.clk(~clk),
		.q(d1)
	);

	d_latch dl_2(
		.d(d1),
		.clk(clk),
		.q(q)
	);
endmodule


