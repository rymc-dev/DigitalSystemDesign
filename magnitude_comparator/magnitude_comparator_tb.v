`timescale 1ns/100ps

module magnitude_comparator_tb;

	reg [3:0] a, b;
	wire eq, gt, lt;

	magnitude_comparator u0_DUT(
		.a(a),
		.b(b),
		.eq(eq),
		.gt(gt),
		.lt(lt)
	);	

	// initiailize inputs
	
	initial begin
		$dumpfile("test_magnitude_comparator.vcd");
		$dumpvars(0, magnitude_comparator_tb);

		// define test

		a=4'b0000; b=4'b0000; // eq == 0

	
		// equality tests 
		#5 a=4'b0001; // eq == 1 
		#5 a=4'b1010; b=4'b1110; // eq == 0
		#5 a=4'b1100; b=4'b1100; // eq == 1

		// greater than tests
		#5 a=4'b0000; b=4'b0000; // gt == 0
		#5 a=4'b1000; // gt = 1
		#5 b=4'b1000; // gt = 0
		#5 a=4'b0101; b=4'b1000; // gt = 0
		#5 a=4'b0101; b=4'b0011; // gt = 1

		// less than tests
		#5 a=4'b0000; b=4'b0000; // lt == 0
		#5 b=4'b0010; //lt = 1
		#5 a=4'b0100; // lt = 0 
		#5 b=4'b1000; // lt = 1


		#5 $finish;
	end


	

endmodule
