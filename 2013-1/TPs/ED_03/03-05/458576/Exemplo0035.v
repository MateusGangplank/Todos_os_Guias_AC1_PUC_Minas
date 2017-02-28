// -------------------------
// Exemplo0035 - F4
// Nome: Bernardo Augusto Godinho de Oliveira
// Matricula: 458576
// -------------------------
// -------------------------
// f4_gate
// -------------------------
module f4 (output s,
input a,
input b,
input x0,
input x1,
input x2);

wire pnot;
not not1 (pnot, a);
wire por;
or or1 (por, a, b);
wire pnor;
nor nor1 (pnor, a, b);
wire pand;
and and1 (pand, a, b);
wire pnand;
nand nand1 (pnand, a, b);
wire pxor;
xor xor1 (pxor, a, b);
wire pxnor;
xnor xnor1 (pxnor, a, b);

wire a1;
wire a2;
wire a3;
wire a4;
wire a5;
wire a6;
wire a7;
// USAR PORTA not PARA ~x1, ~x2, ~x0 TAMBEM
and an1 (a1, ~x0, ~x1, ~x2, pnot);
and an2 (a2, x0, x1, ~x2, por);
and an3 (a3, x0, ~x1, x2, pnor);
and an4 (a4, x0, ~x1, ~x2, pand);
and an5 (a5, ~x0, x1, x2, pnand);
and an6 (a6, ~x0, x1, ~x2, pxor);
and an7 (a7, x0, x1, x2, pxnor);
or orfinal (s, a1, a2, a3, a4, a5, a6, a7);

endmodule // f4
module test_f4;
// ------------------------- definir dados
reg x;
reg y;
reg i0;
reg i1;
reg i2;
wire z0;
f4 modulo (z0, x, y, i0, i1, i2);
// ------------------------- parte principal
initial begin

x = 0; y = 1; i0 = 0; i1 = 0; i2 = 0;
// projetar testes do modulo
#1 $display("%3b %3b %3b",x,y, z0);
end
endmodule // test_f4