//--Pontificia Universidade Catolica
//--Nome: Bruno Santiago Pinheiro
//--Matricula: 405792
//--Data: 30/08/2010
//--Professor: Theldo
//--Guia_05

//------------
//--NOT GATE
//------------

module notgate (s, a);

input a;
output s;

nor NOR1 (s,a,a);

endmodule

//------------
//--AND GATE
//------------

module andgate (s2, a,b);

input a,b;
output s2;

nor NOR1 (s0,a,a);
nor NOR2 (s1,b,b);
nor NOR3 (s2,s0,s1);

endmodule

//------------
//--OR GATE
//------------

module orgate (s1, a, b);

input a, b;
output s1;

nor NOR1 (s0, a, b);
nor NOR2 (s1, s0, s0);

endmodule


//-------------
//--XOR GATE
//-------------

module xorgate (s6, a, b);

input a, b;
output s6;

nor NOR1 (s1, a, a);
nor NOR2 (s2, b, b);
nor NOR3 (s3, a, s2);
nor NOR4 (s4, b, s1);
nor NOR5 (s5, s3, s4);
nor NOR6 (s6, s5, s5);

endmodule

//------------------
//--Meia diferença
//------------------

module halfSubtractor (s4, s3, a, b);

input a, b;
output s3, s4;

notgate NOT1 (s, a);
andgate AND1 (s3, s, b);
xorgate XOR1 (s4, a, b);

endmodule

//---------------------
//--Diferença completa
//---------------------

module fullSubtractor (s5, s3, a, b, c1);

input a, b, c1;
output s5, s3;

halfSubtractor HS1 (s1, s0, a, b);
halfSubtractor HS2 (s3, s2, s1, c1);
orgate OR1 (s5, s2, s0);

endmodule

//-------------------------
//--Diferença de dois bits
//-------------------------

module masterSubtractor (s0, s1, s2, a0, b0, a1, b1);

input a0, b0, a1, b1;
output s0, s1, s2;

halfSubtractor HS1 (s0, s3, a0, b0);
fullSubtractor HS2 (s1, s2, a1, b1, s3);

endmodule

//-------------------------------
//---Teste Diferença dois bits
//-------------------------------


module testmastersubtractor;

wire s0, s1, s2;
reg a0, b0, a1, b1;

masterSubtractor MS (s0, s1, s2, a0, b0, a1, b1);

initial begin

$display ("Bruno Santiago Pinheiro");
$display ("Matricula: 405792");
$display ("Circuito de diferença completa com 2 numeros de 2 bits cada usando apenas NOR.");
$display ();
#1 a0 = 0; a1 = 0; b0 = 0; b1 = 0;
$monitor (" %b%b - %b%b = %b%b%b", a1, a0, b1, b0, s2, s1, s0); 
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

    //--Bruno Santiago Pinheiro
//--    Matricula: 405792
//--    Circuito de diferença completa com 2 numeros de 2 bits cada usando apenas NOR.
//--    
//--     00 - 00 = 000
//--     00 - 10 = 110
//--     00 - 01 = 111
//--     00 - 11 = 011
//--     10 - 00 = 100
//--     10 - 10 = 000
//--     10 - 01 = 001
//--     10 - 11 = 111
//--     01 - 00 = 001
//--     01 - 10 = 111
//--     01 - 01 = 000
//--     01 - 11 = 110
//--     11 - 00 = 101
//--     11 - 10 = 001
//--     11 - 01 = 100
//--     11 - 11 = 000
