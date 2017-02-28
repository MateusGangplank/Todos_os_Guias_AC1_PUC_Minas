 // ------------------------- 
// Exemplo0002 - NOT 
// Nome:Leonardo Machado Decina 
// Matricula:451588
// ------------------------- 
// ------------------------- 
// -- not gate 
// ------------------------- 
module notgate (output s, input p); 
assign s =~p; // criar vinculo permanente 
// (dependencia) 
endmodule //notgate 
// ------------------------- 
// -- test notgate 
// ------------------------- 
module testnotgate; 
// ------------------------- dados locais 
reg a; // definir registrador 
// (variavel independente) 
wire s; // definir conexao (fio) 
// (variavel dependente ) 
// ------------------------- instancia 
notgate NOT1 (s, a); 
// ------------------------- preparacao 
initial begin:start 
a=0; // valor inicial 
end 
// ------------------------- parte principal 
initial begin:main 
// execucao unitaria 
$display("Exemplo 0002 - Leonardo Machado Decina - 451588"); 
$display("Test NOT gate:"); 
$display("\n~a = s\n"); 
a=0;
#1 $display("~%b=%b",a,s);
a=1;
#1 $display("~%b=%b",a,s);
end
endmodule//testnotgate