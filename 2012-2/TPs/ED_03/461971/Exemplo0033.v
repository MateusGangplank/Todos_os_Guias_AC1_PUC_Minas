// -------------------------
// Exemplo0031 - LU3
// Nome: Herbert Alves
// Matricula: 461971
// -------------------------
// -------------------------
//
// -------------------------


module test_lu3;
// ------------------------- definir dados
reg x;
reg y;
reg c;
wire p, q, r, s, d, e, f, g;
and (p, x, y);
or(q, x, y);
nand(r, x, y);
nor(s, x, y);
and (d, p, ~c);
and (e, q, ~c);
and (f, r, c);
and (g, s, c);
// ------------------------- parte principal
initial begin:start
$display("Exemplo0031 - Herbert Alves - 461971");
$display("Test LU's module");
x = 0; y = 0; c = 0;
$display("\n x, y (chave)= and - or - nand - nor\n");
#1 $display("%b, %b (%b)= %b - %b - %b - %b",x,y,c,d,e,f,g);
#1 x = 0; y = 1; c = 0;
$display("%b, %b (%b)= %b - %b - %b - %b",x,y,c,d,e,f,g);
#1x = 1; y = 0; c = 1;
$display("%b, %b (%b)= %b - %b - %b - %b",x,y,c,d,e,f,g);
#1x = 1; y = 1; c = 1;
$display("%b, %b (%b)= %b - %b - %b - %b",x,y,c,d,e,f,g);
end
endmodule // test_f