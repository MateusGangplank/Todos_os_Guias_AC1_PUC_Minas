// -------------------------
// Exemplo0034 - LU4
// Nome: Herbert Alves
// Matricula: 461971
// -------------------------
// -------------------------
//
// -------------------------


module test_lu4;
// ------------------------- definir dados
reg x;
reg y;
reg [1:0]c;
wire p, q, r, s, d, e, f, g;
xor (p, x, y);
xnor(q, x, y);
or(r, x, y);
nor(s, x, y);
and (d, p, ~c[0], ~c[1]);
and (e, q, c[0], ~c[1]);
and (f, r, ~c[0], c[1]);
and (g, s, c[0], c[1]);
// ------------------------- parte principal
initial begin:start
$display("Exemplo0031 - Herbert Alves - 461971");
$display("Test LU's module");
x = 0; y = 0; c = 0;
$display("\n x, y (chave)= xor - xnor - or - nor\n");
#1 $display("%b, %b (%1b)= %b - %b - %b - %b",x,y,c,d,e,f,g);
#1 x = 0; y = 0; c = 1;
$monitor("%b, %b (%1b)= %b - %b - %b - %b",x,y,c,d,e,f,g);
#1x = 0; y = 0; c = 2;
#1x = 0; y = 0; c = 3;
#1x = 1; y = 0; c = 0;
#1x = 0; y = 1; c = 1;
#1x = 1; y = 1; c = 2;
#1x = 0; y = 1; c = 3;
#1x = 1; y = 1; c = 0;
#1x = 1; y = 1; c = 1;
#1x = 1; y = 1; c = 2;
#1x = 1; y = 1; c = 3;
end
endmodule // test_lu4