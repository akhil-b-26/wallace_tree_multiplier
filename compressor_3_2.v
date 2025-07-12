module compressor_3_2 (
    input  wire a,
    input  wire b,
    input  wire c,
    output wire sum,
    output wire carry
);
    assign sum   = a ^ b ^ c;
    assign carry = (a & b) | (b & c) | (a & c);
endmodule