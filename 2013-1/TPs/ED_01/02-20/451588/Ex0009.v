// ------------------------- 
// Exemplo0009 - NAND 
// Nome: Leonardo Machado Decina	 
// Matricula: 451588
// ------------------------- 
// ------------------------- 
// -- nand gate 
// ------------------------- 
module nandgate ( output s, 
input p, 
input q); 
assign s = (~p | ~q); 
endmodule // nandgate 
// --------------------- 
// -- test ´nand gate 
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
$display("Exemplo0009 - Leonardo Machado Decina - 45158"); 
$display("Test NAND gate"); 
$monitor("%d\t%b = %b", a, b, s);
#1 a=0;b=1;
#1 a=1;b=1;
#1 a=1;b=0;
#1 a=0;b=0;
end 
endmodule // testnandgate