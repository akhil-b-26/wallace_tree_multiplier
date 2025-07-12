module wallace_multiplier_structural (
    input  wire clk,
    input  wire rst,
    input  wire en,
    input  wire [7:0] A,
    input  wire [7:0] B,
    output wire [15:0] P
);
    wallace_tree_structural u_wallace (
        .clk(clk),
        .rst(rst),
        .en(en),
        .A(A),
        .B(B),
        .P(P)
    );
endmodule