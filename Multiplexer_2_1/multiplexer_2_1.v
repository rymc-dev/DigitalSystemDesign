module multiplexer_2_1(
	input in1, 
	input in2, 
	input s, 
	output y
);
	assign y = (s) ? in1:in2;
endmodule
