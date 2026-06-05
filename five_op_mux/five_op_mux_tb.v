`timescale 1ns/100ps

module five_op_mux_tb;

	reg [4:0] a,b,c,d,e;
	reg [2:0] opcode;
	wire [4:0] out;
	wire overflow;


	five_op_mux u0_DUT(
		.a(a),
		.b(b),
		.c(c),
		.d(d),
		.e(e)
	);

	initial begin
		
	end

endmodule 
