// -------------------------
// Exemplo0031 - LU1
// Nome: Herbert Alves
// Matricula: 461971
// -------------------------
// -------------------------
// gate
// -------------------------
module lu_sim (output s,
input a,
input b,
input z);
wire [3:0] c;

and (c[0], a, b);
or (c[1], a, b);
and (c[2], c[0], z);
and (c[3], c[1], ~z);
or (s, c[2], c[3]);
endmodule // lu_sim
module test_lu_sim;
// ------------------------- definir dados
reg x, y, z;
wire s;
lu_sim lu1(s, x, y, z);
initial begin:start
x = 0; y = 0; z = 0;
end
// ------------------------- parte principal
initial begin:main
$display("Exemplo0032 - Herbert Alves - 461971");
$display("Test LU's module");
$display("x, y chave em z = s");
$display("\n chave em 0 executa or(x,y), chave em 1 executa and(x,y)\n");
$monitor("%b, %b, chave em %b = %b",x,y,z,s);
#1 x=0; y=0; z=1;
#1 x=0; y=1; z=0;
#1 x=0; y=1; z=1;
#1 x=1; y=0; z=0;
#1 x=1; y=0; z=1;
#1 x=1; y=1; z=0;
#1 x=1; y=1; z=1;
end
endmodule // testa_lu_sim