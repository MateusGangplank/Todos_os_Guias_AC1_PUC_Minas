// -------------------------
// Exemplo0035 - LU5
// Nome: Herbert Alves
// Matricula: 461971
// -------------------------
// -------------------------
//
// -------------------------


module test_lu5;
// ------------------------- definir dados
reg x;
reg y;
reg [2:0]c;
wire [15:0]z;
not (z[0], x);
not (z[1], y);
or(z[2], x, y);
nor(z[3], x, y);
and(z[4], x, y);
nand(z[5], x, y);
xor (z[6], x, y);
xnor(z[7], x, y);


and (z[8], z[0], ~c[2], ~c[1], ~c[0]);
and (z[9], z[1], ~c[2], ~c[1], c[0]);
and (z[10], z[2], ~c[2], c[1], ~c[0]);
and (z[11], z[3], ~c[2], c[1], c[0]);
and (z[12], z[4], c[2], ~c[1], ~c[0]);
and (z[13], z[5], c[2], ~c[1], c[0]);
and (z[14], z[6], c[2], c[1], ~c[0]);
and (z[15], z[7], c[2], c[1], c[0]);
// ------------------------- parte principal
initial begin:start
$display("Exemplo0031 - Herbert Alves - 461971");
$display("Test LU's module");
x = 0; y = 0; c = 0;
$display("\n x, y (chave)= not1-not2-or-nor-and-nand-xor-xnor\n");
#1 $display("%b, %b (%2b)= %b - %b - %b - %b - %b - %b - %b - %b",x,y,c,z[8],z[9],z[10],z[11],z[12],z[13],z[14],z[15]);
#1 x = 0; y = 0; c = 1;
$monitor("%b, %b (%2b)= %b - %b - %b - %b - %b - %b - %b - %b",x,y,c,z[8],z[9],z[10],z[11],z[12],z[13],z[14],z[15]);
#1x = 0; y = 0; c = 2;
#1x = 0; y = 0; c = 3;
#1x = 1; y = 0; c = 4;
#1x = 0; y = 1; c = 5;
#1x = 1; y = 1; c = 6;
#1x = 0; y = 1; c = 7;
#1x = 1; y = 1; c = 6;
#1x = 1; y = 1; c = 5;
#1x = 1; y = 1; c = 4;
#1x = 1; y = 1; c = 3;
end
endmodule // test_lu5