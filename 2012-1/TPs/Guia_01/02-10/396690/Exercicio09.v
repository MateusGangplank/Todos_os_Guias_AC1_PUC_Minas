// ------------------------- 
// Exercicio 09 - AND 
// Nome: Gabriel Benjamim de Carvalho
// Matricula: 396690 
// ------------------------- 
// ------------------------- 
// -- and gate com duas entradas
// ------------------------- 
module andgate2 ( output s, 
input a, 
input b); 
assign s = a & b; 
endmodule // andgate 


//-- And gate principal com 3 entradas

module andgate3 ( output s4, 
input x, 
input y, input c); 
assign s4 = x & y & c; 
endmodule // andgate 

// --------------------- 
// -- test and gate 
// --------------------- 
module testandgate; 
// ------------------------- dados locais 
reg a, b, c; // definir registradores 
wire s ,x, y, s4; // definir conexao (fio) 
// ------------------------- instancia 
andgate2 AND1 (x, a, b); 
andgate2 AND2 (y, a, b);
andgate3 AND3  (s4, x, y, c);
// ------------------------- preparacao 
initial begin:start 
// atribuicao simultanea 
// dos valores iniciais 
a=0; b=0;c=0;  
end 
// ------------------------- parte principal 
initial begin 
$display("Exercicio 09 - Gabriel Benjamim de Carvalho - 396690"); 
$display("Test AND gate"); 
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
endmodule // testandgate