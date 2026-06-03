`timescale 1ns/100ps

module multiplexer_4_1_tb;

	reg a,b,c,d;
	reg [1:0] sel;
	wire y;

	multiplexer_4_1 u0_DUT(
		.a(a),
		.b(b),
		.c(c),
		.d(d),
		.sel(sel),
		.y(y)
	);

	initial begin
		
		$dumpfile("test_4_1_mux.vcd");
		$dumpvars(0, multiplexer_4_1_tb);

		a=1'b0; b=1'b0; c=1'b0; d=1'b0; sel=2'b00; 

		#5 a=1'b1;
		#5 a=1'b0; sel=2'b01; 
		#5 b=1'b1; 
		#5 b=1'b0; sel=2'b10;
		#5 c=1'b1; 
		#5 c=1'b0; sel=2'b11;
		#5 c=1'b1;

		#5 $finish;
	end

endmodule
