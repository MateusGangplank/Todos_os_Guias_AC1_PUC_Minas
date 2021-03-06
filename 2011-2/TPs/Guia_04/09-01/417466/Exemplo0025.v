// -------------------------
// Exemplo0023 - COMPLEMENTO DE 2 
// Nome: Jorge Luis dos Santos Leal 
// Matricula: 417466 
// ------------------------- 
// ------------------------- 
// complemento de 2
// ------------------------- 

module Complemento(a,b,c,d,e,f,s1,s2,s3,s4,s5,s6,t1,t2,t3,t4,t5,t6);
//-------Defini��o de dados
input a,b,c,d,e,f,carry;
output s1,s2,s3,s4,s5,s6,t1,t2,t3,t4,t5,t6;
output s;

not not01(s1,a);
not not02(s2,b);
not not03(s3,c);
not not04(s4,d);
not not05(s5,e);
not not06(s6,f);
xor xor01(t1,s1,carry);
xor xor02(t2,s2,carry);
xor xor03(t3,s3,carry);
xor xor04(t4,s4,carry);
xor xor05(t5,s5,carry);
xor xor06(t6,s6,carry);
endmodule

module Exercicio03;

reg[5:0]a;
wire[5:0]b,s;

// MELHOR PASSAR O REGISTRO INTEIRO, AO INVES DE VALORES INDIVIDUAIS
Complemento comp(a[0],a[1],a[2],a[3],a[4],a[5],b[0],b[1],b[2],b[3],b[4],b[5],s[0],s[1],s[2],s[3],s[4],s[5]);

initial begin

a = 010101;


$display("Exercicio 04 - Jorge Luis dos Santos Leal");
$display("Complemento de 2");
$display("a = %b",a);
a=01010;
$display("a = %b",a);
a=011010;
$display("a = %b",a);
a=101101;
$display("a = %b",a);


end
endmodule