//--Pontificia Universidade Catolica
//--Nome: Bruno Santiago Pinheiro
//--Matricula: 405792
//--Data:30/10/2010
//--Professor: Theldo
//--Guia_08

//-----------------------
//-- AND GATE (2)
//-----------------------

module andgate2 (s1, a, b);

input a, b, c , d;
output s1;

nand NAND1 (s0, a, b);
nand NAND2 (s1, s0, s0);

endmodule

//-----------------------
//-- AND GATE (3)
//-----------------------

module andgate3 (s1, a, b, c);

input a, b, c , d;
output s1;

nand NAND1 (s0, a, b, c);
nand NAND2 (s1, s0, s0, s0);

endmodule

//-------------------------
//-- OR GATE
//-------------------------

module orgate (s, a, b, c);

input a,b,c;
output s;

nand NAND1 (s0,a,a);
nand NAND2 (s1,b,b);
nand NAND3 (s2,c,c);
nand NAND4 (s3, s0, s1);
nand NAND5 (s, s3, s2);


endmodule

//-------------------------------
//---- EXERCICIO 01
//-------------------------------
module exercicio01 (s, a, b, c, d);

input a, b, c, d;
output s;

andgate2 AND1 (s1, ~a, c);
andgate2 AND2 (s2, ~b, c);
andgate3 AND3 (s3, a, b, ~d);
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
$display ("Simplificacao do circuito dado no exercicio01 guia08, usando apenas portas NAND ");
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
