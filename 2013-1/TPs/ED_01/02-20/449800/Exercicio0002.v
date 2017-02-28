// ------------------------- 
// Exercicio0002 - NOR 
// Nome: Fabio Fiuza Pereira
// Matricula: 406087 
// ------------------------- 
// ------------------------- 
// -- NOR gate 
// ------------------------- 
module norgate ( output s, 
input p, 
input q); 
assign s = ~(p | q); 
endmodule // norgate 
// --------------------- 
// -- test NOR gate 
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
$display("Exemplo0001 -Fabio Fiuza Pereira - 406087"); 
$display("NOR gate"); 
$display("\na & b = s\n"); 
a=0; b=0; 
#1 $monitor("%b & %b = %b", a, b, s); 
#1a=0; b=1;
#1a=1; b=0;
#1a=1; b=1;


end 
endmodule // testnorgate 