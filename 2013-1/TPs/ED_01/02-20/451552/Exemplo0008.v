// ------------------------- 
// Exemplo0008 - XNOR 
// Nome: Felipe C�ssio Vieira Ferreira
// Matricula: 451552
// ------------------------- 
// ------------------------- 
// -- xnor gate 
// ------------------------- 
module xnorgate ( output s,input p, q); 
assign s = ~(p ^ q); 
endmodule // xnorgate 
// --------------------- 
// -- test xnor gate 
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
$display("Exemplo0008 - Felipe C�ssio Vieira Ferreira- 451552"); 
$display("Test XNOR gate"); 
$display("\na ~^ b = s\n"); 
#1 a=0; b=0; 
$monitor("%b ~^ %b = %b", a, b, s); 
#1 a=0; b=1; 
#1 a=1; b=0; 
#1 a=1; b=1; 
 
end 
endmodule // testxnorgate