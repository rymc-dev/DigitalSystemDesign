module one_bit_full_adder(
	input a,
	input b,
	input cin,
	output sum,
	output cout
);
	assign sum = (a ^ b ^ cin);
	assign cout = (cin & (a|b)) | (~cin & (a & b));
endmodule
