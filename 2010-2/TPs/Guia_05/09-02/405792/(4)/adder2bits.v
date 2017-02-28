           //--Pontificia Universidade Catolica
//--Nome: Bruno Santiago Pinheiro
//--Matricula: 405792
//--Data: 30/08/2010
//--Professor: Theldo
//--Guia_05

//------------
//--AND GATE
//------------

module andgate (s1, a, b);

input a, b;
output s1;

nand NAND1 (s0, a, b);

nand NAND2 (s1, s0, s0);

endmodule

//------------
//--NOT GATE
//------------

module notgate (s, a);

input a;
output s;

nand AND1 (s,a,a);

endmodule

//------------
//--OR GATE
//------------

module orgate (s2, a,b);

input a,b;
output s2;

nand NAND1 (s0,a,a);
nand NAND2 (s1,b,b);
nand NAND3 (s2,s0,s1);

endmodule

//--------------
//--HALF ADDER
//--------------

module halfadder (s3, s4, a, b);

input a, b;
output s3, s4;

notgate NOT1 (s,a);
notgate NOT2 (s0,b);
andgate AND1 (s1,a,s0);
andgate AND2 (s2,s, b);
orgate OR1 (s3, s1, s2);
andgate AND3 (s4, a, b);

endmodule

//---------------------
//-- FULL ADDER
//---------------------
module fullAdder (s0, s1, a, b, v1);

input a, b, v1;
output s0, s1;

halfadder HA1 (s2, s3, a, b);
halfadder HA2 (s0, s4, s2, v1);
or OR1 (s1, s3, s4);

endmodule

//-------------------------
//--CIRCUITO LOGICO SOMA
//-------------------------

module masterAdder (s0, s1, s2, s3, a0, b0, a1, b1, a2, b2);

input a0, b0, a1, b1, a2, b2;
output s0, s1, s2, s3;

halfadder HA1 (s0, sa, a0, b0);
fullAdder FA1 (s1, sb, a1, b1, sa);
fullAdder FA2 (s2, s3, a2, b2, sb);


endmodule


//------------------------------------
//-- TESTE CIRCUITO LOGICO SOMA
//------------------------------------

module testmasterAdder;

wire s0, s1, s2, s3;
reg a0, b0, a1, b1, a2, b2;

masterAdder MA (s0, s1, s2, s3, a0, b0, a1, b1, a2, b2);

initial begin

$display ("Bruno Santiago Pinheiro");
$display ("Matricula: 405792");
$display ("Fazer um somador para 2 numero de 3 bits.");

#1 a0=0; a1=0; a2=0; b0=0; b1=0; b2=0;
$monitor ("%b%b%b + %b%b%b = %b%b%b%b", a2, a1, a0, b2, b1, b0, s3, s2, s1, s0);
#1 a0=0; a1=0; a2=0; b0=0; b1=0; b2=1;

#1 a0=0; a1=0; a2=0; b0=0; b1=1; b2=0;
#1 a0=0; a1=0; a2=0; b0=0; b1=1; b2=1;

#1 a0=0; a1=0; a2=0; b0=1; b1=0; b2=0;
#1 a0=0; a1=0; a2=0; b0=1; b1=0; b2=1;

#1 a0=0; a1=0; a2=0; b0=1; b1=1; b2=0;
#1 a0=0; a1=0; a2=0; b0=1; b1=1; b2=1;

#1 a0=0; a1=0; a2=1; b0=0; b1=0; b2=0;
#1 a0=0; a1=0; a2=1; b0=0; b1=0; b2=1;

#1 a0=0; a1=0; a2=1; b0=0; b1=1; b2=0;
#1 a0=0; a1=0; a2=1; b0=0; b1=1; b2=1;

#1 a0=0; a1=0; a2=1; b0=1; b1=0; b2=0;
#1 a0=0; a1=0; a2=1; b0=1; b1=0; b2=1;

#1 a0=0; a1=0; a2=1; b0=1; b1=1; b2=0;
#1 a0=0; a1=0; a2=1; b0=1; b1=1; b2=1;

#1 a0=0; a1=1; a2=0; b0=0; b1=0; b2=0;
#1 a0=0; a1=1; a2=0; b0=0; b1=0; b2=1;

#1 a0=0; a1=1; a2=0; b0=0; b1=1; b2=0;
#1 a0=0; a1=1; a2=0; b0=0; b1=1; b2=1;

#1 a0=0; a1=1; a2=0; b0=1; b1=0; b2=0;
#1 a0=0; a1=1; a2=0; b0=1; b1=0; b2=1;

#1 a0=0; a1=1; a2=0; b0=1; b1=1; b2=0;
#1 a0=0; a1=1; a2=0; b0=1; b1=1; b2=1;

#1 a0=0; a1=1; a2=1; b0=0; b1=0; b2=0;
#1 a0=0; a1=1; a2=1; b0=0; b1=0; b2=1;

#1 a0=0; a1=1; a2=1; b0=0; b1=1; b2=0;
#1 a0=0; a1=1; a2=1; b0=0; b1=1; b2=1;

#1 a0=0; a1=1; a2=1; b0=1; b1=0; b2=0;
#1 a0=0; a1=1; a2=1; b0=1; b1=0; b2=1;

#1 a0=0; a1=1; a2=1; b0=1; b1=1; b2=0;
#1 a0=0; a1=0; a2=1; b0=1; b1=1; b2=1;

#1 a0=1; a1=0; a2=0; b0=0; b1=0; b2=0;
#1 a0=1; a1=0; a2=0; b0=0; b1=0; b2=1;

#1 a0=1; a1=0; a2=0; b0=0; b1=1; b2=0;
#1 a0=1; a1=0; a2=0; b0=0; b1=1; b2=1;

#1 a0=1; a1=0; a2=0; b0=1; b1=0; b2=0;
#1 a0=1; a1=0; a2=0; b0=1; b1=0; b2=1;

#1 a0=1; a1=0; a2=0; b0=1; b1=1; b2=0;
#1 a0=1; a1=0; a2=0; b0=1; b1=1; b2=1;

#1 a0=1; a1=0; a2=1; b0=0; b1=0; b2=0;
#1 a0=1; a1=0; a2=1; b0=0; b1=0; b2=1;

#1 a0=1; a1=0; a2=1; b0=0; b1=1; b2=0;
#1 a0=1; a1=0; a2=1; b0=0; b1=1; b2=1;

#1 a0=1; a1=0; a2=1; b0=1; b1=0; b2=0;
#1 a0=1; a1=0; a2=1; b0=1; b1=0; b2=1;

#1 a0=1; a1=0; a2=1; b0=1; b1=1; b2=0;
#1 a0=1; a1=0; a2=1; b0=1; b1=1; b2=1;

#1 a0=1; a1=1; a2=0; b0=0; b1=0; b2=0;
#1 a0=1; a1=1; a2=0; b0=0; b1=0; b2=1;

#1 a0=1; a1=1; a2=0; b0=0; b1=1; b2=0;
#1 a0=1; a1=1; a2=0; b0=0; b1=1; b2=1;

#1 a0=1; a1=1; a2=0; b0=1; b1=0; b2=0;
#1 a0=1; a1=1; a2=0; b0=1; b1=0; b2=1;

#1 a0=1; a1=1; a2=0; b0=1; b1=1; b2=0;
#1 a0=1; a1=1; a2=0; b0=1; b1=1; b2=1;

#1 a0=1; a1=1; a2=1; b0=0; b1=0; b2=0;
#1 a0=1; a1=1; a2=1; b0=0; b1=0; b2=1;

#1 a0=1; a1=1; a2=1; b0=0; b1=1; b2=0;
#1 a0=1; a1=1; a2=1; b0=0; b1=1; b2=1;

#1 a0=1; a1=1; a2=1; b0=1; b1=0; b2=0;
#1 a0=1; a1=1; a2=1; b0=1; b1=0; b2=1;

#1 a0=1; a1=1; a2=1; b0=1; b1=1; b2=0;
#1 a0=1; a1=1; a2=1; b0=1; b1=1; b2=1;

end

endmodule