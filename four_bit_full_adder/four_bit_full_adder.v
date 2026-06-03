module four_bit_full_adder(
	input [3:0] a,
	input [3:0] b,
	output [3:0] sum,
	output overflow
);
	reg const = 1'b0;
	wire a1_to_a2;
	wire a2_to_a3; 
	wire a3_to_a4;

	one_bit_full_adder a1(
		.a(a[0]),
		.b(b[0]),
		.cin(const),
		.cout(a1_to_a2),
		.sum(sum[0])
	);

	one_bit_full_adder a2(
		.a(a[1]),
		.b(b[1]),
		.cin(a1_to_a2),
		.cout(a2_to_a3),
		.sum(sum[1])
	);

	one_bit_full_adder a3(
		.a(a[2]),
		.b(b[2]),
		.cin(a2_to_a3),
		.cout(a3_to_a4),
		.sum(sum[2])
	);

	one_bit_full_adder a4(
		.a(a[3]),
		.b(b[3]),
		.cin(a3_to_a4),
		.cout(overflow),
		.sum(sum[3])
	);
endmodule

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

