// ------------------------
// ExercicioJ
// Aluna: Úrsula Rosa Monteiro de Castro
// Matrícula: 427468
// ------------------------
module calculaS2(output s, input a, input b, input c, input d);
wire [1:0] sNot;
wire [4:0] sAnd;
wire sOr;

not NOT1 (sNot[0], c);
not NOT2 (sNot[1], d);

and AND1 (sAnd[0], b, sNot[0]);
and AND2 (sAnd[1], sAnd[0], sNot[1]);

and AND3 (sAnd[2], a, b);
and AND4 (sAnd[3], sAnd[2], sNot[1]);

and AND5 (sAnd[4], a, sNot[0]);

or OR1(sOr, sAnd[1], sAnd[3]);
or OR2(s, sOr, sAnd[4]);
endmodule //calculaS2

module testS2;
reg a;
reg b;
reg c;
reg d;
wire s;
calculaS2 testeS2 (s, a, b, c, d);
initial begin
 $display ("Exercício J");
 $display ("Úrsula Rosa - 427468");
 $display ("AB CD  S");
 a=0; b=0; c=0; d=0;
 $monitor ("%b%b %b%b  %b",a,b,c,d,s);
 #1 a=0; b=0; c=0; d=1;  
 #1 a=0; b=0; c=1; d=0;
 #1 a=0; b=1; c=0; d=0;
 #1 a=1; b=0; c=0; d=0;
end
endmodule //testS2