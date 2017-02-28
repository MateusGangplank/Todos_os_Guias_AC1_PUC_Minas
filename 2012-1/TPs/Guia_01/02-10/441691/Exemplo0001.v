// ------------------------- 
// Exemplo0001 - buffer 
// Nome: Gabriel Luiz M. G. Vieira
// Matricula: 441691 
// ------------------------- 
// ------------------------- 
// -- buffer 
// ------------------------- 
module buffer (output s, input p); 
assign s = p; // criar vinculo permanente 
// (dependencia) 
endmodule // buffer 
// ------------------------- 
// -- test buffer 
// ------------------------- 
module testbuffer; 
// ------------------------- dados locais 
reg a; // definir registrador 
// (variavel independente) 
wire s; // definir conexao (fio) 
// (variavel dependente ) 
// ------------------------- instancia 
buffer BF1 (s, a); 
// ------------------------- preparacao 
initial begin:start 
a=0; // valor inicial 
end 
// ------------------------- parte principal 
initial begin:main 
// execucao unitaria 
$display("Exemplo 0001 - Gabriel Luiz M. G. Vieira - 441691"); 
$display("Test buffer:"); 
$display("\t time\ta = s"); 
// execucao permanente 
$monitor("%d\t%b = %b", $time, a, s); 
// apos uma unidade de tempo 
// mudar valor do registrador para 1 
#1 a=1; 
// apos duas unidades de tempo 
// mudar valor do registrador para 0 
#2 a=0; 
end 
endmodule // testbuffer 