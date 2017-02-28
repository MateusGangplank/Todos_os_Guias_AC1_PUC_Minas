// ------------------------- 
// Exercicio 10 - OR 
// Nome: Gabriel Benjamim de Carvalho
// Matricula: 396690 
// ------------------------- 
// ------------------------- 
// -- or gate com duas entradas
// ------------------------- 
module orgate2 ( output s, 
input a, 
input b); 
assign s = a | b; 
endmodule // andgate 


//-- or gate principal com 3 entradas

module orgate3 ( output s4, 
input x, 
input y, input c); 
assign s4 = x | y | c; 
endmodule // andgate 

// --------------------- 
// -- test or gate 
// --------------------- 
module testorgate; 
// ------------------------- dados locais 
reg a, b, c; // definir registradores 
wire s ,x, y, s4; // definir conexao (fio) 
// ------------------------- instancia 
orgate2 OR1 (x, a, b); 
orgate2 OR2 (y, a, b);
orgate3 OR3  (s4, x, y, c);
// ------------------------- preparacao 
initial begin:start 
// atribuicao simultanea 
// dos valores iniciais 
a=0; b=0;c=0;  
end 
// ------------------------- parte principal 
initial begin 
$display("Exercicio 10 - Gabriel Benjamim de Carvalho - 396690"); 
$display("Test OR gate"); 
$display("\t\t time\t\a b c = s"); 
// execucao permanente 
$monitor("%d\t%b %b %b = %b", $time, a,b,c,s4);

#1 a=0;b=0;c=0;
#1 a=0;b=0;c=1;
#1 a=0;b=1;c=0;
#1 a=0;b=1;c=1;
#1 a=1;b=0;c=0;
#1 a=1;b=0;c=1;
#1 a=1;b=1;c=0;
#1 a=1;b=1;c=1;
end 
endmodule // testorgate