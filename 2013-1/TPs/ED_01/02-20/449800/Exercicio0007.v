// ------------------------- 
// Exercicio0007 - XNOR 
// Nome: Fabio Fiuza Pereira
// Matricula: 406087 
// ------------------------- 
// ------------------------- 
// -- XNOR gate 
// ------------------------- 
module xnorgate ( output s, 
input p, 
input q); 
assign s = ((p|q)+(~p|~q)); 
endmodule // xnorgate 
// --------------------- 
// -- test XNOR gate 
// --------------------- 
module testxnorgate; 
// ------------------------- dados locais 
reg a, b; // definir registradores 
wire s; // definir conexao (fio) 
// ------------------------- instancia 
xnorgate XNOR1 (s, a, b); 
// ------------------------- preparacao 
initial begin:start 
// atribuicao simultanea 
// dos valores iniciais 
a=0; b=0; 
end 
// ------------------------- parte principal 
initial begin 
$display("Exemplo0003 -Fabio Fiuza Pereira - 406087"); 
$display("XNOR gate"); 
$display("\na & b = s\n"); 
a=0; b=0; 
#1 $monitor("%b & %b = %b", a, b, s); 
#1a=0; b=1;
#1a=1; b=0;
#1a=1; b=1;


end 
endmodule // testxnorgate 