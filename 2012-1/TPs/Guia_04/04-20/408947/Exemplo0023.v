// ------------------------- 
// Exemplo0023 - COMPARADOR DE IGUALDADE 
// Nome: Guilherme Moreira Nunes  
// Matricula: 408947 
// ------------------------- 
// ------------------------- 
// comparador de igualdade
// ------------------------- 

module Comparador(a,b,c,d,e,f,a2,b2,c2,d2,e2,f2,s1,s2,s3,s4,s5,s6,s);
//-------Definição de dados
input a,b,c,d,e,f,a2,b2,c2,d2,e2,f2;
output s1,s2,s3,s4,s5,s6;
output s;

xnor Xnor01(s1,a,a2);
xnor Xnor02(s2,b,b2);
xnor Xnor03(s3,c,c2);
xnor Xnor04(s4,d,d2);
xnor Xnor05(s5,e,e2);
xnor Xnor01(s6,f,f2);
and And01(s,s1,s2,s3,s4,s5,s6);
endmodule

module Exercicio03;

reg[5:0]a;
reg[5:0]b;
wire[5:0]s;
wire s0;

Comparador comp(a[0],a[1],a[2],a[3],a[4],a[5],b[0],b[1],b[2],b[3],b[4],b[5],s[0],s[1],s[2],s[3],s[4],s[5],s0);

initial begin

a = 010101;
b = 010101;


$display("Exercicio 03 - Guilherme Moreira Nunes ");
$display("Comparador de igualdade");
$display("0 - a = b");
$display("1 - a != b");
$display("%b , %b",a,b);


end
endmodule