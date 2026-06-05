module five_op_mux(
	input [4:0] a,b,c,d,e,
	input op[2:0],
	output [4:0] out,
	output overflow
);	
	always (*) begin
		case (op) begin
			2'b000 : out = a; // add 
			2'b100 : out = b; // sub
			2'b101 : out = c; // and 
			2'b110 : out = d; // or 
			2'b111 : out = e; // xor
			default : out = 2'b000;  
		end
		
	end

endmodule
