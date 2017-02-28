// ------------------------- 
// Exemplo0003 - AND 
// Nome: Gabriel Luiz M. G. Vieira 
// Matricula: 441691 
// ------------------------- 
// ------------------------- 
// -- and gate 
// ------------------------- 
module andgate ( output s, 
input p, 
input q); 
assign s = p & q; 
endmodule // andgate 
// --------------------- 
// -- test and gate 
// --------------------- 
module testandgate; 
// ------------------------- dados locais 
reg a, b; // definir registradores 
wire s; // definir conexao (fio) 
// ------------------------- instancia 
andgate AND1 (s, a, b); 
// ------------------------- preparacao 
initial begin:start 
// atribuicao simultanea 
// dos valores iniciais 
a=0; b=0; 
end 
// ------------------------- parte principal 
initial begin 
$display("Exemplo0003 - Gabriel Luiz M. G. Vieira - 441691"); 
$display("Test AND gate"); 
$display("\na & b = s\n");
$monitor("%b & %b = %b", a, b, s); 
#1a=0; b=0;  
#1a=0; b=1; 
#1a=1; b=0; 
#1a=1; b=1; 

end 
endmodule // testandgate 