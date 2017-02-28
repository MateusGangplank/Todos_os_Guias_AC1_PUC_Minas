//--Pontificia Universidade Catolica
//--Nome: Bruno Santiago Pinheiro
//--Matricula: 405792
//--Data:30/10/2010
//--Professor: Theldo
//--Guia_08



//-------------------------------
//---- EXERCICIO 01
//-------------------------------
module exercicio01 (s, a, b, c, d);

input a, b, c, d;
output s;

and AND1 (s1, ~a, c);
and AND2 (s2, ~b, c);
and AND3 (s3, a, b, ~d);
or OR1 (s, s1, s2, s3);

endmodule

//--------------------------------
//------ TESTE DO EXERCICIO 01
//--------------------------------

module testexercicio01;

reg a, b, c, d;
wire s;

exercicio01 EX1 (s, a, b, c, d);


initial begin

$display ("Bruno Santiago Pinheiro");
$display ("Matricula: 405792");
$display ("Simplificacao do circuito dado no exercicio01 guia08");
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

//-- Exercicio feito no ConTEXT, não consegui copiar o teste feito.

