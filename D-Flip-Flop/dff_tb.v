`timescale 1ns/100ps

module dff_tb;

	reg d, clk;
	wire q;

	d_latch u0_dut( 
		.d(d),
		.clk(clk),
		.q(q)
	);

	initial begin
;		$dumpfile("test_dff");
		$dumpvars(0,dff_tb);

		d=1'b0; clk=1'b0;

		#5 d=1'b1; clk=1'b1;
		#1 clk = 1'b0;
		#5 d=1'b0; clk = 1'b1;
		#1 clk = 1'b0;
		#5 
		#5 $finish;
	end
endmodule
