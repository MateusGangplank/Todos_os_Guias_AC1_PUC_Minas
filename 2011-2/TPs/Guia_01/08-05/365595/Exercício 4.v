// -------------------------
// Ex4  
// Nome: Vinicius Bordoni
// Matricula: 365595
// -------------------------
// -------------------------
// -- AND_Morgan gate
// -------------------------
module AND_Morgangate ( output s,
input p, q, r);
assign s = ( ~((~p)|(~q)|(~r)) );
endmodule // AND_Morgangate
// ---------------------
// -- test AND_Morgan gate
// ---------------------
module testAND_Morgangate;
// ------------------------- dados locais
reg a, b, c; // definir registradores
wire s; // definir conexao (fio)
// ------------------------- instancia
AND_Morgangate AND_Morgan1 (s, a, b, c);
// ------------------------- preparacao
initial begin:start
a=0; b=0; c=0;
end

// ------------------------- parte principal
initial begin
$display("Ex1 Nand gate - Vinicius Bordoni - 365595");
$display("Test AND_Morgan gate");
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
endmodule // testAND_Morgangate