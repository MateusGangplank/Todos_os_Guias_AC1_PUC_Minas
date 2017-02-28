// -------------------------
// Ex1  gate 2 entradas
// Nome: Vinicius Bordoni
// Matricula: 365595
// -------------------------
// -------------------------
// -- nand gate
// -------------------------
module nandgate ( output s,
input a, b);
assign s = ( ~(a&b) );
endmodule // nandgate
// ---------------------
// -- test nand gate
// ---------------------
module testnandgate;
// ------------------------- dados locais
reg p, q; // definir registradores
wire s; // definir conexao (fio)
// ------------------------- instancia
nandgate NAND1 (s, p, q);
// ------------------------- preparacao
initial begin:start
p=0; q=0;
end

// ------------------------- parte principal
initial begin
$display("Ex1 Nand gate - Vinicius Bordoni - 365595");
$display("Test nand gate");
$display("\np  q = s\n");
p=0; q=0;
#1 $display("%b   %b  = %b",p, q, s);
p=0; q=1;
#1 $display("%b   %b  = %b", p, q, s);
p=1; q=0;
#1 $display("%b   %b  = %b", p, q, s);
p=1; q=1;
#1 $display("%b   %b  = %b", p, q, s);
end
endmodule // testnandgate