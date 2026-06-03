`timescale 1ns/100ps 
module multiplexer_2_1_tb;

	reg in1, in2, s;
	wire y;

	multiplexer_2_1 u0_DUT(
		.in1(in1),
		.in2(in2),
		.s(s),
		.y(y)
	);

	// initialize inputs
	
	initial begin
	
	// simulation files dumped to the test_2_1 mux file
		$dumpfile("test2_1mux.vcd");
		$dumpvars(0,multiplexer_2_1_tb);
		in1=1'b0; in2=1'b0; s=1'b0;

		#5 in1=1'b1;
		#5 s=1'b1;
		#5 in2=1'b1;
		#5 in1=1'b0; 
		#5 s=1'b0;

		#5 $finish; 
	end
endmodule	
