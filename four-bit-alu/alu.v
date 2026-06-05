module four_bit_alu(
    input  wire [3:0] a,
    input  wire [3:0] b,
    input  wire [2:0] opcode,
    output wire       overflow_flag,
    output reg  [3:0] result
);

    wire [3:0] add_result;
    wire [3:0] sub_result;

    wire add_overflow;
    wire sub_overflow;

    reg overflow_reg;

    assign overflow_flag = overflow_reg;

    four_bit_full_adder adder(
        .a(a),
        .b(b),
        .sum(add_result),
        .overflow(add_overflow)
    );

    full_subtractor subtractor(
        .A(a),
        .B(b),
        .result(sub_result),
        .overflow(sub_overflow)
    );

    always @(*) begin
        overflow_reg = 1'b0;

        case(opcode)

            // ADD
            3'b000: begin
                result = add_result;
                overflow_reg = add_overflow;
            end

            // SUB
            3'b100: begin
                result = sub_result;
                overflow_reg = sub_overflow;
            end

            // AND
            3'b101: begin
                result = a & b;
            end

            // OR
            3'b110: begin
                result = a | b;
            end

            // XOR
            3'b111: begin
                result = a ^ b;
            end

            default: begin
                result = 4'b0000;
            end

        endcase
    end

endmodule


module four_bit_full_adder(
    input  wire [3:0] a,
    input  wire [3:0] b,
    output wire [3:0] sum,
    output wire       overflow
);

    wire c1;
    wire c2;
    wire c3;
    wire c4;

    one_bit_full_adder fa0(
        .a(a[0]),
        .b(b[0]),
        .cin(1'b0),
        .sum(sum[0]),
        .cout(c1)
    );

    one_bit_full_adder fa1(
        .a(a[1]),
        .b(b[1]),
        .cin(c1),
        .sum(sum[1]),
        .cout(c2)
    );

    one_bit_full_adder fa2(
        .a(a[2]),
        .b(b[2]),
        .cin(c2),
        .sum(sum[2]),
        .cout(c3)
    );

    one_bit_full_adder fa3(
        .a(a[3]),
        .b(b[3]),
        .cin(c3),
        .sum(sum[3]),
        .cout(c4)
    );

    // signed overflow
    assign overflow = c3 ^ c4;

endmodule


module one_bit_full_adder(
    input  wire a,
    input  wire b,
    input  wire cin,
    output wire sum,
    output wire cout
);

    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (cin & (a ^ b));

endmodule


module full_subtractor(
    input  wire [3:0] A,
    input  wire [3:0] B,
    output wire [3:0] result,
    output wire       overflow
);

    assign result = A - B;

    // signed overflow
    assign overflow =
        (A[3] != B[3]) &&
        (result[3] != A[3]);

endmodule