module magnitude_comparator(
	input [3:0] a,
	input [3:0] b,
	output eq,
	output gt,
	output lt
);	
	
	assign eq = 	~( a[0] ^ b[0] ) &
			~( a[1] ^ b[1] ) &
			~( a[2] ^ b[2] ) &
			~( a[3] ^ b[3] );

	assign gt = 	( a[3] & ~b[3] ) | 
			( ~(a[3] ^ b[3]) & a[2] & ~b[2] ) |
			( ~(a[2] ^ b[2]) & a[1] & ~b[1] ) |
			( ~(a[1] ^ b[1]) & a[0] & ~b[0] );
	
	assign lt = 	( b[3] & ~a[3] ) |
			( ~(b[3] ^ a[3] ) & b[2] & ~a[2]) |
			( ~(b[2] ^ a[2] ) & b[1] & ~a[1]) |
			( ~(b[1] ^ a[1] ) & b[0] & ~a[0]);
endmodule
