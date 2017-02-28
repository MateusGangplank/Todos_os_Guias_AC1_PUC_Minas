// ------------------------- 
// Exercicio 01 - 02
// Nome: Lorena Danielle Gonçalves Bento 
// Matricula: 435049 
// ------------------------- 
// ------------------------- 
// -- nor  gate 
// -------------------------  
module norgate (output s, input a, input b); 
assign s = (~(a|b)) ; // criar vinculo permanente 
// (dependencia) 
endmodule // norgate 
// --------------------- 
// -- test nor  gate 
// --------------------- 
module testnorgate; 
// ------------------------- dados locais 
reg a, b; // definir registrador 
// (variavel independente) 
wire s; // definir conexao (fio) 
// (variavel dependente )
// ------------------------- instancia 
norgate NOR1 (s, a, b); 
// ------------------------- preparacao 
initial begin:start 
a=0;b=0; 
end 
// ------------------------- parte principal 
initial begin:main 
$monitor("Exercicio01 - Lorena Danielle Gonçalves Bento - 435049"); 
$monitor("Test nor gate"); 
$monitor("\n (~(a|b)) = s\n"); 
$monitor("%b & %b = %b", a, b, s); 
a=0; b=0;
#1 $monitor("%b & %b = %b", a, b, s); 
a=0;b=1;
#1 $monitor("%b & %b = %b", a, b, s);  
a=1;b=0; 
#1 $monitor("%b & %b = %b", a, b, s); 
a=1;b=1; 
#1 $monitor("%b & %b = %b", a, b, s); 
end 
endmodule // testnandgate 

