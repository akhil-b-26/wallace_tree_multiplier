module clock_gating (
    input  wire clk,
    input  wire en,
    output wire gated_clk
);
    assign gated_clk = clk & en;
endmodule