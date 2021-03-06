//--Pontificia Universidade Catolica
//--Nome: Bruno Santiago Pinheiro
//--Matricula: 405792
//--Data:30/10/2010
//--Professor: Theldo
//--Guia_08



//-------------------------------
//---- EXERCICIO 03
//-------------------------------
module exercicio03 (s, a, b, c, d, e);

input a, b, c, d, e;
output s;

and AND1 (s1, b, c, e);
and AND2 (s2, b, c, d);
and AND3 (s3, c, d, e);
and AND4 (s4, ~a, ~b, ~d);
and AND5 (s5, ~a, b, ~c, ~d);
and AND6 (s6, a, ~b, c, ~d);
and AND7 (s7, a, b, d, e);
and AND8 (s8, a, ~b, ~c, ~d, e);
and AND9 (s9, a, ~b, ~c, d, ~e);
or OR1 (s, s1, s2, s3, s4, s5, s6, s7, s8, s9);

endmodule

//--------------------------------
//------ TESTE DO EXERCICIO 03
//--------------------------------

module testexercicio03;

reg a, b, c, d, e;
wire s;

exercicio03 EX3 (s, a, b, c, d, e);


initial begin

$display ("Bruno Santiago Pinheiro");
$display ("Matricula: 405792");
$display ("Simplificacao do circuito dado no exercicio02 guia08");
$display ("a b c d e = s");

#1 a=0; b=0; c=0; d=0; e=0;

$monitor ("%b %b %b %b %b = %b",a, b, c, d, e, s);


#1 a=0; b=0; c=0; d=0; e=1;
#1 a=0; b=0; c=0; d=1; e=0;
#1 a=0; b=0; c=0; d=1; e=1;
#1 a=0; b=0; c=1; d=0; e=0;
#1 a=0; b=0; c=1; d=0; e=1;
#1 a=0; b=0; c=1; d=1; e=0;
#1 a=0; b=0; c=1; d=1; e=1;
#1 a=0; b=1; c=0; d=0; e=0;
#1 a=0; b=1; c=0; d=0; e=1;
#1 a=0; b=1; c=0; d=1; e=0;
#1 a=0; b=1; c=0; d=1; e=1;
#1 a=0; b=1; c=1; d=0; e=0;
#1 a=0; b=1; c=1; d=0; e=1;
#1 a=0; b=1; c=1; d=1; e=0;
#1 a=0; b=1; c=1; d=1; e=1;
#1 a=1; b=0; c=0; d=0; e=0;
#1 a=1; b=0; c=0; d=0; e=1;
#1 a=1; b=0; c=0; d=1; e=0;
#1 a=1; b=0; c=0; d=1; e=1;
#1 a=1; b=0; c=1; d=0; e=0;
#1 a=1; b=0; c=1; d=0; e=1;
#1 a=1; b=0; c=1; d=1; e=0;
#1 a=1; b=0; c=1; d=1; e=1;
#1 a=1; b=1; c=0; d=0; e=0;
#1 a=1; b=1; c=0; d=0; e=1;
#1 a=1; b=1; c=0; d=1; e=0;
#1 a=1; b=1; c=0; d=1; e=1;
#1 a=1; b=1; c=1; d=0; e=0;
#1 a=1; b=1; c=1; d=0; e=1;
#1 a=1; b=1; c=1; d=1; e=0;
#1 a=1; b=1; c=1; d=1; e=1;




end
endmodule

//-- Exercicio feito no ConTEXT, n�o consegui copiar o teste feito.