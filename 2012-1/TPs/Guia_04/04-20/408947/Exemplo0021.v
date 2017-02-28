// ------------------------- 
// Exemplo0021 - FULL ADDER 
// Nome: Guilherme Moreira Nunes 
// Matricula: 408947 
// ------------------------- 
// ------------------------- 
// full adder 
// ------------------------- 

module HalfAdder(input a, input b,output s, output cout);
//definição de portas
xor Xor01(s,a,b);
and And01(cout,a,b);
endmodule


 module fullAdder (output s, input a, input b, input carryIn); 
 
//---------------------------Outras variaveis
 output cout; 
 wire fio1,fio2,fio3;
//-------------------------- descrever por portas 
HalfAdder meiaSoma01(a,b,fio1,fio2);
HalfAdder meiaSoma02(carryIn,fio1,s,fio3);
or Or02(cout,fio2,fio3);


endmodule // fullAdder 

module test_fullAdder(soma,x,y,carry); 
// ------------------------- definir dados 
output [5:0] soma; 
input [5:0] x; 
output carry;
input [5:0] y;

HalfAdder soma1(x[0],y[0],soma[0],carry);
fullAdder soma2(soma[1],x[1],y[1],carry);
fullAdder soma3(soma[2],x[2],y[2],carry);
fullAdder soma4(soma[3],x[3],y[3],carry);
fullAdder soma5(soma[4],x[4],y[4],carry);
fullAdder soma6(soma[5],x[5],y[5],carry);

endmodule

module Exercicio01;
reg [5:0] x; 
reg [5:0] y; 
wire carry; 
wire [5:0] soma;

test_fullAdder Soma(soma,x,y,carry);


// ------------------------- parte principal  
initial begin 
x=0;
y=0;
$display("Exemplo0021 - Guilherme Moreira Nunes  - 408947"); 
$display("Test ALU's full adder"); 

// projetar testes do somador complete
$display("a + b = soma - Carry Out");
$monitor("%b + %b = %b  %b",x,y,soma,carry);

#1 x = 100010; y = 101010;
#1 x = 101100; y = 100010;
#1 x = 1010; y = 1000;
#1 x = 10010; y = 10010;
#1 x = 10110; y = 10100;
#1 x = 11111; y = 11111;


end 
endmodule // test_fullAdder 

/*
Algumas contas não dão certo, e não consigo achar o erro.
*/