`timescale 1ns/100ps

module four_bit_full_adder_tb;
	
	reg [3:0] a, b;
	wire [3:0] sum;
	wire overflow;

	four_bit_full_adder u0_DUT(
		.a(a),
		.b(b),
		.sum(sum),
		.overflow(overflow)
	);

	initial begin
		$dumpfile("test_four_bit_full_adder.vcd");
		$dumpvars(0,four_bit_full_adder_tb);

		a=4'b0000; b=4'b0000;
		
		#5 a=4'b0001; b=4'b0000; 
		#5 a=4'b0101; b=4'b1000;
		#5 a=4'b1000; b=4'b1000;
		#5 $finish; 
	end
	
endmodule
