//------------------------- 
// Exemplo0002 - NOT 
// Nome: Jorge Luis dos Santos Leal 
// Matricula: 417466 
// ------------------------- 
// ------------------------- 
// -- not gate 
// ------------------------- 
module notgate (output s, input p); 
assign s =~p; // criar vinculo permanente 
// (dependencia) 
endmodule // notgate 
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
notgate NOT1(s, a); 
// ------------------------- preparacao 
initial begin:start 
a=0; 
end 
// ------------------------- parte principal 
initial begin
// execucao unitaria 
$display("Exemplo 0001 - Jorge Luis dos Santos Leal - 417466"); 
$display("Test NOT gate:"); 
$display("\n~a = s\n"); 
a=0; 
#1 $display("~%b = %b", a, s); 
a=1; 
#1 $display("~%b = %b", a, s);  
end 
endmodule // testnotgate 


//-----------------------------------------------------------------------


