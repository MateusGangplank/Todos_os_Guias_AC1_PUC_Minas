// ------------------------- 
// Exemplo0006 - 	NAND 
// Nome: Felipe C�ssio Vieira Ferreira
// Matricula: 451552
// ------------------------- 
// ------------------------- 
// -- and gate 
// ------------------------- 
module nandgate ( output s, input p, input q); 
assign s = ~(p & q); 
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
$display("Exemplo0006 - Felipe C�ssio Vieira Ferreira- 451552"); 
$display("Test NAND gate"); 
$display("\na ~& b = s\n"); 
a=0; b=0; 
#1 $display("%b ~& %b = %b", a, b, s); 
a=0; b=1; 
#1 $display("%b ~& %b = %b", a, b, s); 
a=1; b=0; 
#1 $display("%b ~& %b = %b", a, b, s); 
a=1; b=1; 
#1 $display("%b ~& %b = %b", a, b, s); 
end 
endmodule // testandgate 