//--Pontificia Universidade Catolica
//--Nome: Bruno Santiago Pinheiro
//--Matricula: 405792
//--Data:30/10/2010
//--Professor: Theldo
//--Guia_08



//-------------------------------
//---- EXERCICIO 02
//-------------------------------
module exercicio02 (s, a, b, c, d);

input a, b, c, d;
output s;

and AND1 (s1, ~a, ~b, ~d);
and AND2 (s2, ~a, ~c, ~d);
and AND3 (s3, a, ~b, ~c);
and AND4 (s4, a, ~b, d);
and AND5 (s5, a, ~c, d);
or OR1 (s, s1, s2, s3, s4, s5);

endmodule

//--------------------------------
//------ TESTE DO EXERCICIO 02
//--------------------------------

module testexercicio02;

reg a, b, c, d;
wire s;

exercicio02 EX2 (s, a, b, c, d);


initial begin

$display ("Bruno Santiago Pinheiro");
$display ("Matricula: 405792");
$display ("Simplificacao do circuito dado no exercicio02 guia08");
$display ("a b c d = s");

#1 a=0; b=0; c=0; d=0;

$monitor ("%b %b %b %b = %b",a, b, c, d, s);

#1 a=0; b=0; c=0; d=1;
#1 a=0; b=0; c=1; d=0;
#1 a=0; b=0; c=1; d=1;
#1 a=0; b=1; c=0; d=0;
#1 a=0; b=1; c=0; d=1;
#1 a=0; b=1; c=1; d=0;
#1 a=0; b=1; c=1; d=1;
#1 a=1; b=0; c=0; d=0;
#1 a=1; b=0; c=0; d=1;
#1 a=1; b=0; c=1; d=0;
#1 a=1; b=0; c=1; d=1;
#1 a=1; b=1; c=0; d=0;
#1 a=1; b=1; c=0; d=1;
#1 a=1; b=1; c=1; d=0;
#1 a=1; b=1; c=1; d=1;



end
endmodule

//-- Exercicio feito no ConTEXT, n�o consegui copiar o teste feito.