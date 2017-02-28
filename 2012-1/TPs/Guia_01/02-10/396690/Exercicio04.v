 // ------------------------- 
// Exercicio 04 - NAND 
// Nome: Gabriel Benjamim de Carvalho
// Matricula: 396690 
// ------------------------- 
// ------------------------- 
// -- NAND 
// ------------------------- 
module nandgate (output s, input a, input b); 
assign s = ~a | ~b;  
// (dependencia) 
endmodule //  
// ------------------------- 
// -- test NAND 
// ------------------------- 
module testnand; 
// ------------------------- dados locais 
reg a; // definir registrador 
// (variavel independente)
reg b; 
wire s; // definir conexao (fio) 
// (variavel dependente ) 
// ------------------------- instancia 
nandgate NAND1 (s, a, b); 
// ------------------------- preparacao 
initial begin:start 
a=0;
b=0; // valor inicial 
end 
// ------------------------- parte principal 
initial begin:main 
// execucao unitaria 
$display("Exercicio 04 - Gabriel Benjamim de Carvalho - 396690"); 
$display("NAND Gate:"); 
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
endmodule // testbuffer 	