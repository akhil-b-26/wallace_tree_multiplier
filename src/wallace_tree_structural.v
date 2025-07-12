`timescale 1ns / 1ps

module wallace_tree_structural (
    input  wire clk,
    input  wire rst,
    input  wire en,
    input  wire [7:0] A,
    input  wire [7:0] B,
    output reg  [15:0] P
);
    wire gated_clk;
    clock_gating cg_inst (
        .clk(clk),
        .en(en),
        .gated_clk(gated_clk)
    );

    // Stage 0: Generate partial products
    wire [7:0] pp [7:0];
    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin: pp_gen
            assign pp[i] = A & {8{B[i]}};
        end
    endgenerate

    // Stage 1: Compress using compressor_3_2
    wire [15:0] s1, c1;
    compressor_3_2 c00 (.a(pp[0][1]), .b(pp[1][0]), .c(pp[2][0]), .sum(s1[1]), .carry(c1[2]));
    compressor_3_2 c01 (.a(pp[0][2]), .b(pp[1][1]), .c(pp[2][1]), .sum(s1[2]), .carry(c1[3]));
    compressor_3_2 c02 (.a(pp[0][3]), .b(pp[1][2]), .c(pp[2][2]), .sum(s1[3]), .carry(c1[4]));
    compressor_3_2 c03 (.a(pp[0][4]), .b(pp[1][3]), .c(pp[2][3]), .sum(s1[4]), .carry(c1[5]));
    compressor_3_2 c04 (.a(pp[0][5]), .b(pp[1][4]), .c(pp[2][4]), .sum(s1[5]), .carry(c1[6]));
    compressor_3_2 c05 (.a(pp[0][6]), .b(pp[1][5]), .c(pp[2][5]), .sum(s1[6]), .carry(c1[7]));
    compressor_3_2 c06 (.a(pp[0][7]), .b(pp[1][6]), .c(pp[2][6]), .sum(s1[7]), .carry(c1[8]));

    assign s1[0] = pp[0][0];
    assign s1[8] = pp[1][7];
    assign s1[9] = pp[2][7];
    assign s1[10] = pp[3][7];
    assign s1[11] = pp[4][7];
    assign s1[12] = pp[5][7];
    assign s1[13] = pp[6][7];
    assign s1[14] = pp[7][7];
    assign s1[15] = 1'b0;

    assign c1[0] = 1'b0;
    assign c1[1] = 1'b0;
    assign c1[9] = 1'b0;
    assign c1[10] = 1'b0;
    assign c1[11] = 1'b0;
    assign c1[12] = 1'b0;
    assign c1[13] = 1'b0;
    assign c1[14] = 1'b0;
    assign c1[15] = 1'b0;

    // Stage 2: Pipeline Register for s1 and c1
    reg [15:0] s1_reg, c1_reg;
    always @(posedge gated_clk or posedge rst) begin
        if (rst) begin
            s1_reg <= 0;
            c1_reg <= 0;
        end else begin
            s1_reg <= s1;
            c1_reg <= c1;
        end
    end

    // Stage 3: Final CPA Addition and Pipeline Register
    wire [15:0] result;
    assign result = s1_reg + c1_reg;

    always @(posedge gated_clk or posedge rst) begin
        if (rst)
            P <= 0;
        else
            P <= result;
    end

endmodule
