module multiplexer_4_1(
	input a,
	input b,
	input c,
	input d,
	input [1:0] sel,
	output y
);
	assign y = (~sel[1] & ~sel[0] & a) | 
		   (~sel[1] & sel[0] & b) |
		   (sel[1] & ~sel[0] & c) | 
		   (sel[1] & sel[1] & d);
endmodule
