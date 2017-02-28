//--Pontificia Universidade Catolica
//--Nome: Bruno Santiago Pinheiro
//--Matricula: 405792
//--Data: 30/08/2010
//--Professor: Theldo
//--Guia_05


//-----------------
//---- MEIA SOMA
//-----------------

module halfSubtractor (s0, s1, a, b);

input a, b;
output s0, s1;

xor XOR1 (s0, a, b);
not NOT1 (s, a);
and AND1 (s1, s, b);

endmodule

//---------------------
//--diferença COMPLETA
//---------------------

module fullSubtractor (s0, s1, a, b, v1);

input a, b, v1;
output s0, s1;

halfSubtractor HS1 (s3, s4, a, b);
halfSubtractor HS2 (s0, s5, s3, v1);
or OR1 (s1, s4, s5);

endmodule

//-----------------------
//--DIFERENÇA DOIS Bits
//-----------------------

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
$display ("Circuito de diferença completa com 2 numeros de 2 bits cada.");
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
   //-- Matricula: 405792
   //-- Circuito de diferença completa com 2 numeros de 2 bits cada.
    
  //--   00 - 00 = 000
   //--  00 - 10 = 110
   //--  00 - 01 = 111
   //--  00 - 11 = 101
  //--   10 - 00 = 010
   //--  10 - 10 = 000
   //--  10 - 01 = 001
  //--   10 - 11 = 111
   //--  01 - 00 = 001
  //--   01 - 10 = 111
  //--   01 - 01 = 000
  //--   01 - 11 = 110
  //--   11 - 00 = 011
   //--  11 - 10 = 001
  //--   11 - 01 = 010
   //--  11 - 11 = 000
