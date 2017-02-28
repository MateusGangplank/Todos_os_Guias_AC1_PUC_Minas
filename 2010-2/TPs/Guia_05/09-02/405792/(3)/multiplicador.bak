//--Pontificia Universidade Catolica
//--Nome: Bruno Santiago Pinheiro
//--Matricula: 405792
//--Data: 30/08/2010
//--Professor: Theldo
//--Guia_05

//---------------
//-- meia soma
//---------------

module halfadder (s3, s4, a, b);

input a, b;
output s3, s4;

not NOT1 (s,a);
not NOT2 (s0,b);
and AND1 (s1,a,s0);
and AND2 (s2,s, b);
or OR1 (s3, s1, s2);
and AND3 (s4, a, b);

endmodule

//----------------
//--Multiplicador
//----------------

module multiplicador (e0, e1, e2, e3, a0, b0, a1, b1);

input a0, b0, a1, b1;
output e0, e1, e2, e3;

and AND1 (e0, b0, a0);
and AND2 (s2, b0, a1);
and AND3 (s3, b1, a0);
and AND4 (s4, b1, a1);

halfadder HA1 (e1, s5, s2, s3);
halfadder HA2 (e2, e3, s5, s4);

endmodule

//----------------------
//--teste multiplicador
//----------------------

module testmultiplicador;

wire s0, s1, s2, s3;
reg a0, b0, a1, b1;

multiplicador M1 (s0, s1, s2, s3, a0, b0, a1, b1);

initial begin

$display ("Bruno Santiago Pinheiro");
$display ("Matricula: 405792");
$display ("Circuito de multiplicaçao com 2 numeros de 2 bits cada.");
$display ();
#1 a0 = 0; a1 = 0; b0 = 0; b1 = 0;
$monitor (" %b%b * %b%b = %b%b%b%b", a1, a0, b1, b0, s3, s2, s1, s0);
#1 a0 = 0; a1 = 0; b0 = 0; b1 = 1;

#1 a0 = 0; a1 = 0; b0 = 1; b1 = 0;
#1 a0 = 0; a1 = 0; b0 = 1; b1 = 1;

#1 a0 = 0; a1 = 1; b0 = 0; b1 = 0;
#1 a0 = 0; a1 = 1; b0 = 0; b1 = 1;

#1 a0 = 0; a1 = 1; b0 = 1; b1 = 0;
#1 a0 = 0; a1 = 1; b0 = 1; b1 = 1;

#1 a0 = 1; a1 = 0; b0 = 0; b1 = 0;
#1 a0 = 1; a1 = 0; b0 = 0; b1 = 1;

#1 a0 = 1; a1 = 0; b0 = 1; b1 = 0;
#1 a0 = 1; a1 = 0; b0 = 1; b1 = 1;

#1 a0 = 1; a1 = 1; b0 = 0; b1 = 0;
#1 a0 = 1; a1 = 1; b0 = 0; b1 = 1;

#1 a0 = 1; a1 = 1; b0 = 1; b1 = 0;
#1 a0 = 1; a1 = 1; b0 = 1; b1 = 1;

end

endmodule