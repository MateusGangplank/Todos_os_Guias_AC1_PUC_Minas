// ---------------------
// Exemplo0008 - xnor
// Nome: Ailton Gomes
// Matricula: 440092
// ---------------------
// ---------------------
// -- xnor gate
// ---------------------
module xnorgate (output s,
input p,
input q);
assign s = ~(p ^ q);
endmodule // xnor
// ---------------------
// -- test xnorgate
// ---------------------
module testxnorgate;
// ------------------------- dados locais
reg a,b; // definir registrador
wire s; // definir conexao (fio)
// ------------------------- instancia
xnorgate XNOR1 (s, a, b);
// ------------------------- preparacao
initial begin:start
a=0; //  valores binarios
b=0; //  valores binarios
end
// ------------------------- parte principal
initial begin:main
$display("Exemplo0008 - Ailton Gomes - 440092");
$display("Test xnor gate");
$display("\n ~(a ^ b) = s\n");
$monitor("%b ^ %b = %b", a, b, s);
#1 a=0; b=0; // valores decimais
#1 a=1; b=0;
#1 a=0; b=1;
#1 a=1; b=1;
end
endmodule // testxorgate