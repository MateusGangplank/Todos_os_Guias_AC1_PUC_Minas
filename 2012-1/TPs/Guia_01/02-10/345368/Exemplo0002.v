// ------------------------- 
// Exemplo0002 - NAND
// Nome: Marcio Santan Correa 
// Matricula: 345368
// ------------------------- 
// ------------------------- 
// -- not gate 
// ------------------------- 
module notgate (output s, input p); 
assign s = ~p; // criar vinculo permanente 
// (dependencia) 
endmodule // not 
// ------------------------- 
// -- test not gate 
// ------------------------- 
module testnotgate; 
// ------------------------- dados locais 
reg a; // definir registrador 
// (variavel independente) 
wire s; // definir conexao (fio) 
// (variavel dependente ) 
// ------------------------- instancia 
notgate NOT1 (s, a); 
// ------------------------- parte principal 
initial begin
// execucao unitaria 
$display("Exemplo 0002 - Marcio Santana - 345368"); 
$display("Test NOT gate:"); 
$display("\n~a = s\n"); 
a=0;
// execucao permanente 
#1 $display("~%b = %b", a, s); 
// apos uma unidade de tempo 
// mudar valor do registrador para 0 
a=1;
#1 $display("~%b = %b", a, s); 
// apos duas unidades de tempo  
end 
endmodule // testbuffer 