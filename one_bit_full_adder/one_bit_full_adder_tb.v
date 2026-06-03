`timescale 1ns/100ps

module one_bit_full_adder_tb;

	reg a, b, cin;
	wire sum, cout;

	one_bit_full_adder u0_DUT(
		.a(a),
		.b(b),
		.cin(cin),
		.sum(sum),
		.cout(cout)
	);

	// initialize inputs
	
	initial begin
		$dumpfile("test_one_bit_full_adder.vcd");
		$dumpvars(0,one_bit_full_adder_tb);

		a=1'b0; b=1'b0; cin=1'b0;

		#5 a=1'b1;
		#5 a=1'b0; b=1'b1;
		#5 b=1'b0; cin=1'b1;
		#5 a=1'b1; 
		#5 cin=1'b0; b=1'b1; 
		#5 cin=1'b1; a=1'b0;
		#5 a=1'b1;
		#5 $finish;
	end

endmodule
