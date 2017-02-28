// ------------------------- 
// Exercicio0002 - NOR
// Nome: Marcio Santana Correa 
// Matricula: 345368
// ------------------------- 
// ------------------------- 
// -- nor gate 
// ------------------------- 
module norgate ( output s, input p, q ); 
assign s = ~( p | q ); 
endmodule // norgate 
// --------------------- 
// -- test nor gate 
// --------------------- 
module tesnorgate; 
// ------------------------- dados locais 
reg a;
reg b; // definir registradores 
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
$display("Exercicio0002 - Marcio Santana Correa 345368");
$display("Test NOR gate"); 
$display("\na ~| b = s\n"); 
a=0; b=0; 
$monitor("%b ~| %b = %b", a, b, s); 
#1 a=0; b=1;  
#1 a=1; b=0; 
#1 a=1; b=1; 
end 
endmodule // testnorgate 