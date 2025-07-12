`timescale 1ns / 1ps

module tb_wallace_structural;
    reg clk;
    reg rst;
    reg en;
    reg [7:0] A, B;
    wire [15:0] P;

    wallace_multiplier_structural uut (
        .clk(clk),
        .rst(rst),
        .en(en),
        .A(A),
        .B(B),
        .P(P)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $display("Wallace Tree Structural Simulation Start");
        rst = 1; en = 0; A = 0; B = 0;
        #20;
        rst = 0; en = 1;

        A = 8'd15; B = 8'd3;
        #20;
        A = 8'd7;  B = 8'd11;
        #20;
        A = 8'd25; B = 8'd8;
        #20;
        A = 8'd255; B = 8'd2;
        #20;

        $finish;
    end
endmodule