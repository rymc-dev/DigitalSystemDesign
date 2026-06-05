`timescale 1ns/100ps

module eight_bit_register_tb;

    reg [7:0] D;
    reg load_enable, reset, clk;
    wire [7:0] Q;

    eight_bit_register u0_DUT(
        .D(D),
        .load_enable(load_enable),
        .reset(reset),
        .clk(clk),
        .Q(Q)
    );

    // Clock generation: 10 ns period
    always begin
        #5 clk = ~clk;
    end

    initial begin
        $dumpfile("test_eight_bit_register.vcd");
        $dumpvars(0, eight_bit_register_tb);

        clk = 1'b0;
        D = 8'b00000000;
        load_enable = 1'b0;
        reset = 1'b1;

        // Hold reset for one clock edge
        #10;
        reset = 1'b0;

        // Load first value
        D = 8'b10001111;
        load_enable = 1'b1;
        #10;

        // Disable loading; Q should hold 10001111
        load_enable = 1'b0;
        D = 8'b11110000;
        #10;

        // Enable loading; Q should update to 11110000
        load_enable = 1'b1;
        #10;

        // Reset; Q should become 00000000
        reset = 1'b1;
        #10;

        reset = 1'b0;
        load_enable = 1'b0;
        D = 8'b10101010;
        #10;

        $finish;
    end

endmodule
