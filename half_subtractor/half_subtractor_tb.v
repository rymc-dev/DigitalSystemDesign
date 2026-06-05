`timescale 1ns/100ps

module half_subtractor_tb;

	reg a, b;
	wire difference, borrow;

	half_subtractor U0_DUT(
		.a(a),
		.b(b),
		.difference(difference),
		.borrow(borrow)
	);

	initial begin
		$dumpfile("test_half_subtractor");
		$dumpvars(0,half_subtractor_tb);

		a=1'b0; b=1'b0;

		#5 a=1'b1;
		#5 b=1'b1; 
		#5 a=1'b0; 
		#5 $finish;
	end	

endmodule
