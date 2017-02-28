// ------------------------- 
// Extra01 - NOT 
// Nome: Marcio Santana Correa
// Matricula: 345368
// ------------------------- 

// ------------------------- 
// -- not gate 
// ------------------------- 
module notgate (output s, input p, input r); 
assign s = ~p & ~r;  // criar vinculo permanente 
// (dependencia) 
endmodule // not 
// ------------------------- 
// -- test not gate 
// ------------------------- 
module testnotgate; 
// ------------------------- dados locais 
reg a;
reg b; // definir registrador 
// (variavel independente) 
wire s; // definir conexao (fio) 
// (variavel dependente )
// ------------------------- instancia 
notgate NOT1 (s, a, b); 
// ------------------------- parte principal 
initial begin
// execucao unitaria 
$display("Extra 01 - Guilherme Moreira Nunes - 408947");  
$display("\n~a & ~b = x"); 
$monitor("~%b & ~%b = %b", a, b, s);
#1 a=0; b=0;
#1 a=0; b=1;
#1 a=1; b=0;
#1 a=1; b=1;
end 
endmodule