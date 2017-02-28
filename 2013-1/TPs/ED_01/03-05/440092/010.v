// ---------------------
// Exercicio 010 - or
// Nome: Ailton Gomes
// Matricula: 440092
// ---------------------
// ---------------------
// -- or gate
// ---------------------
module orgate (output s,
input p,
input q);
assign s =  ( p | q );
endmodule// or
// ---------------------
// -- or3 gate
// ---------------------
module or3gate (output s,
input p,
input q,
input r);
wire x;
orgate OR0 (x, p, q);
orgate OR1 (s, r, x);
endmodule // or3
// ---------------------
// -- test or3gate
// ---------------------
module testor3gate;
// ------------------------- dados locais
reg a,b,c; // definir registrador
wire s; // definir conexao (fio)
// ------------------------- instancia
or3gate OR1 (s, a, b, c);
// ------------------------- preparacao
initial begin:start
a=0; //  valores binarios
b=0; //  valores binarios
end
// ------------------------- parte principal
initial begin:main
$display("Exercicio 010 - Ailton Gomes - 440092");
$display("Test xor gate");
$display("\n (a | b) = s\n");
$monitor("%b ^ %b = %b", a, b, s);
#1 a=0; b=0; // valores decimais
#1 a=1; b=0;
#1 a=0; b=1;
#1 a=1; b=1;
end
endmodule // testxorgate