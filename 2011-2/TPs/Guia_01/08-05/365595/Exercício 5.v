// -------------------------
// Ex1  gate 2 entradas
// Nome: Vinicius Bordoni
// Matricula: 365595
// -------------------------
// -------------------------
// -- OR_Morgan gate
// -------------------------
module OR_Morgangate ( output s,
input p, q, r);
assign s = ( ~((~p)&(~q)&(~r)) );
endmodule // OR_Morgangate
// ---------------------
// -- test OR_Morgan gate
// ---------------------
module testOR_Morgangate;
// ------------------------- dados locais
reg a, b, c; // definir registradores
wire s; // definir conexao (fio)
// ------------------------- instancia
OR_Morgangate OR_Morgan1 (s, a, b, c);
// ------------------------- preparacao
initial begin:start
a=0; b=0; c=0;
end

// ------------------------- parte principal
initial begin
$display("Ex1 Nand gate - Vinicius Bordoni - 365595");
$display("Test OR_Morgan gate");
$display("\na  b = s\n");
$monitor("%b   %b  %b  =  %b", a, b, c, s); 
#1 a=0; b=0; c=0;
#1 a=0; b=0; c=1;
#1 a=0; b=1; c=0;
#1 a=0; b=1; c=1;
#1 a=1; b=0; c=0;
#1 a=1; b=0; c=1;
#1 a=1; b=1; c=0;
#1 a=1; b=1; c=1;
end
endmodule // testOR_Morgangate