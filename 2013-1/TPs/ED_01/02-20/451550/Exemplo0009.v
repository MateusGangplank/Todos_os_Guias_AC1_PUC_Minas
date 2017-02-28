// ------------------------- 
// Exemplo0009 - NAND 
// Nome: Eduardo de Figueiredo Junior
// Matricula: 451550
// ------------------------- 
// ------------------------- 
// -- nand gate 
// ------------------------- 
module nandgate ( output s,input p, q); 
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
nandgate NAND1 (s, a, b); 
// ------------------------- preparacao 
initial begin:start 
// atribuicao simultanea 
// dos valores iniciais 
a=0; b=0; 
end 
// ------------------------- parte principal 
initial begin 
$display("Exemplo0009 - Eduardo de Figueiredo Junior - 451550"); 
$display("Test NAND gate"); 
$display("\na ~& b = s\n"); 
#1 a=0; b=0; 
$monitor("%b ~& %b = %b", a, b, s); 
#1 a=0; b=1; 
#1 a=1; b=0; 
#1 a=1; b=1; 
 
end 
endmodule // testnandgate