module full_subtractor(
	input wire  [3:0] A,
	input wire  [3:0] B,
	output wire [3:0] result,
	output wire	  overflow
);
	assign result = A - B;

	assign overflow = (A[3] != B[3]) && (result[3] != A[3]);

endmodule 
