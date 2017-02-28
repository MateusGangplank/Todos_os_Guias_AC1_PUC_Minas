 // ------------------------- 
// Exercicio 07 - XNOR 
// Nome: Gabriel Benjamim de Carvalho
// Matricula: 396690 
// ------------------------- 
// ------------------------- 
// -- xnor 
// ------------------------- 
module xnorgate (output s, input a, input b); 
assign s = (a&b)|(~a&~b);  
// (dependencia) 
endmodule //  
// ------------------------- 
// -- test xnor 
// ------------------------- 
module testxnor; 
// ------------------------- dados locais 
reg a; // definir registrador 
// (variavel independente)
reg b; 
wire s; // definir conexao (fio) 
// (variavel dependente ) 
// ------------------------- instancia 
xnorgate XNOR1 (s, a, b); 
// ------------------------- preparacao 
initial begin:start 
a=0;
b=0; // valor inicial 
end 
// ------------------------- parte principal 
initial begin:main 
// execucao unitaria 
$display("Exercicio 07 - Gabriel Benjamim de Carvalho - 396690"); 
$display("XNOR Gate:"); 
$display("\t\t time\ta b = s"); 
// execucao permanente 
$monitor("%d\t%b %b = %b", $time, a, b, s); 
// apos uma unidade de tempo 
// mudar valor do registrador para 0 
#1 a=0;b=1; 
// apos duas unidades de tempo 
// mudar valor do registrador para 1 
#1 a=1;b=0;
#1 a=1;b=1; 
end 
endmodule // testxnor	