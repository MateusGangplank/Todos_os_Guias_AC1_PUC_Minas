// ------------------------- 
// Exercicio0004 - NAND 
// Nome: Gabriel Luiz M. G. Vieira 
// Matricula: 441691 
// ------------------------- 
// ------------------------- 
// -- nand gate 
// ------------------------- 
module andgate ( output s, 
input p, 
input q); 
assign s = ~p | ~q; 
endmodule // nandgate 
// --------------------- 
// -- test nand gate 
// --------------------- 
module testnandgate; 
// ------------------------- dados locais 
reg a, b; // definir registradores 
wire s; // definir conexao (fio) 
// ------------------------- instancia 
andgate NAND1 (s, a, b); 
// ------------------------- preparacao 
initial begin:start 
// atribuicao simultanea 
// dos valores iniciais 
a=0; b=0; 
end 
// ------------------------- parte principal 
initial begin 
$display("Exercicio0004 - Gabriel Luiz M. G. Vieira - 441691"); 
$display("Test NAND gate"); 
$display("\n~a | ~b = s\n"); 
$monitor("~%b | ~%b = %b", a, b, s); 
#1a=0; b=0;  
#1a=0; b=1; 
#1a=1; b=0; 
#1a=1; b=1; 
end
endmodule // testandgate 