// -------------------------
// Ex1  gate 2 entradas
// Nome: Vinicius Bordoni
// Matricula: 365595
// -------------------------
// -------------------------
// -- XNOR gate
// -------------------------
module XNORgate ( output s,
input p, q);
assign s = ( ~(p^q) );
endmodule // XNORgate
// ---------------------
// -- test XNOR gate
// ---------------------
module testXNORgate;
// ------------------------- dados locais
reg a, b; // definir registradores
wire s; // definir conexao (fio)
// ------------------------- instancia
XNORgate XNOR1 (s, a, b);
// ------------------------- preparacao
initial begin:start
a=0; b=0;
end

// ------------------------- parte principal
initial begin
$display("Ex1 Nand gate - Vinicius Bordoni - 365595");
$display("Test XNOR gate");
$display("\na  b = s\n");
$monitor("%b   %b  =  %b", a, b, s); 
#1 a=0; b=0; // valores decimais 
#1 a=1; b=0;
#1 a=0; b=1;
#1 a=1; b=1;
end
endmodule // testXNORgate