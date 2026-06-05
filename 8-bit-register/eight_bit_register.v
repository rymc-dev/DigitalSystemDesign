module dff(
    input d,
    input clk,
    input reset,
    output reg q
);
    always @(posedge clk) begin
        if (reset)
            q <= 1'b0;
        else
            q <= d;
    end
endmodule


module eight_bit_register(
    input [7:0] D,
    input load_enable,
    input reset,
    input clk,
    output [7:0] Q
);
    wire [7:0] next_D;

    assign next_D = load_enable ? D : Q;

    dff b0(.d(next_D[0]), .clk(clk), .reset(reset), .q(Q[0]));
    dff b1(.d(next_D[1]), .clk(clk), .reset(reset), .q(Q[1]));
    dff b2(.d(next_D[2]), .clk(clk), .reset(reset), .q(Q[2]));
    dff b3(.d(next_D[3]), .clk(clk), .reset(reset), .q(Q[3]));
    dff b4(.d(next_D[4]), .clk(clk), .reset(reset), .q(Q[4]));
    dff b5(.d(next_D[5]), .clk(clk), .reset(reset), .q(Q[5]));
    dff b6(.d(next_D[6]), .clk(clk), .reset(reset), .q(Q[6]));
    dff b7(.d(next_D[7]), .clk(clk), .reset(reset), .q(Q[7]));

endmodule
