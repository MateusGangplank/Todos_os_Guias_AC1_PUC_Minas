// ------------------------- 
// Exemplo0021 - FULL SUBTRACTOR 
// Nome: Guilherme Moreira Nunes 
// Matricula: 408947 
// ------------------------- 
// ------------------------- 
// full Subtractor 
// ------------------------- 

module HalfSubtractor(input a, input b,output s, output cout);
//definição de portas
xor Xor01(s,a,b);
and And01(cout,a,b);
endmodule


 module fullSubtractor (output s, input a, input b, input carryIn); 
 
//---------------------------Outras variaveis
 output cout; 
 wire fio1,fio2,fio3;
//-------------------------- descrever por portas 
HalfSubtractor meiaSub01(a,b,fio1,fio2);
HalfSubtractor meiaSub02(carryIn,fio1,s,fio3);
or Or02(cout,fio2,fio3);


endmodule // fullSubtractor 

module test_fullSubtractor(sub,x,y,carry); 
// ------------------------- definir dados 
output [5:0] sub; 
input [5:0] x; 
output carry;
input [5:0] y;

HalfSubtractor sub1(x[0],y[0],sub[0],carry);
fullSubtractor sub2(sub[1],x[1],y[1],carry);
fullSubtractor sub3(sub[2],x[2],y[2],carry);
fullSubtractor sub4(sub[3],x[3],y[3],carry);
fullSubtractor sub5(sub[4],x[4],y[4],carry);
fullSubtractor sub6(sub[5],x[5],y[5],carry);

endmodule

module Exercicio02;
reg [5:0] x; 
reg [5:0] y; 
wire carry; 
wire [5:0] sub;

test_fullSubtractor Sub(sub,x,y,carry);


// ------------------------- parte principal  
initial begin 
x=0;
y=0;
$display("Exemplo0022 - Guilherme Moreira Nunes  - 408947"); 
$display("Test ALU's full Subtractor");
$display("a - b = c ");  
$display("%b - %b = %b %b",x,y,sub,carry);
#1 x=101010; y=100001;
$display("%b - %b = %b %b",x,y,sub,carry);

end 
endmodule  