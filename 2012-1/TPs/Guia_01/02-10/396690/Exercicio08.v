// ------------------------- 
// Exercicio 08 - AND 
// Nome: Gabriel Benjamim de Carvalho
// Matricula: 396690 
// ------------------------- 
// ------------------------- 
// -- and gate 
// ------------------------- 
module andgate ( output s, 
input a, 
input b, input c); 
assign s = a & b & c; 
endmodule // andgate 
// --------------------- 
// -- test and gate 
// --------------------- 
module testandgate; 
// ------------------------- dados locais 
reg a, b, c; // definir registradores 
wire s; // definir conexao (fio) 
// ------------------------- instancia 
andgate AND1 (s, a, b, c); 
// ------------------------- preparacao 
initial begin:start 
// atribuicao simultanea 
// dos valores iniciais 
a=0; b=0; c=0; 
end 
// ------------------------- parte principal 
initial begin 
$display("Exercicio 08 - Gabriel Benjamim de Carvalho - 396690"); 
$display("Test AND gate"); 
$display("\t time\ta b c = s"); 
// execucao permanente 
$monitor("%d\t%b %b %b = %b", $time, a,b,c,s);
#1 a=0;b=0;c=0;
#1 a=0;b=0;c=1;
#1 a=0;b=1;c=0;
#1 a=0;b=1;c=1;
#1 a=1;b=0;c=0;
#1 a=1;b=0;c=1;
#1 a=1;b=1;c=0;
#1 a=1;b=1;c=1;
end 
endmodule // testandgate