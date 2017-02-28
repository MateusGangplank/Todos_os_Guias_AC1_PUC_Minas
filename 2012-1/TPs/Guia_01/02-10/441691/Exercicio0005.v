// ------------------------- 
// Exercicio0005 - NOR 
// Nome: Gabriel Luiz M. G. Vieira 
// Matricula: 441691 
// ------------------------- 
// ------------------------- 
// -- nor gate 
// ------------------------- 
module norgate ( output s, 
input p, q); 
assign s = ~p & ~q; 
endmodule // norgate 
// --------------------- 
// -- test nor gate 
// --------------------- 
module testnorgate; 
// ------------------------- dados locais 
reg a, b; // definir registradores 
wire s; // definir conexao (fio) 
// ------------------------- instancia 
norgate NOR1 (s, a, b); 
// ------------------------- preparacao 
initial begin:start 
// atribuicao simultanea 
// dos valores iniciais 
a=0; b=0; 
end 
// ------------------------- parte principal 
initial begin 
$display("Exercicio0005 - Gabriel Luiz M. G. Vieira - 441691"); 
$display("Test NOR gate"); 
$display("\n~a & ~b = s\n"); 
$monitor("~%b & ~%b = %b", a, b, s); 
#1a=0; b=0;  
#1a=0; b=1; 
#1a=1; b=0; 
#1a=1; b=1; 
end 
endmodule // testorgate 