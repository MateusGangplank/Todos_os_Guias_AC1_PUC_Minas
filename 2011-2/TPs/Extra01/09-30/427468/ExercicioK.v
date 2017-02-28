// ------------------------
// ExercicioK
// Aluna: Úrsula Rosa Monteiro de Castro
// Matrícula: 427468
// ------------------------
module calculaS1(output s, input a, input b, input c, input d);
wire [1:0] sXnor;
xnor XNOR1 (sXnor[0], a, c);
xnor XNOR2 (sXnor[1], b, d);
and AND1 (s, sXnor[0], sXnor[1]);
endmodule //calculaS1

module testS1;
reg a;
reg b;
reg c;
reg d;
wire s;
calculaS1 testeS1 (s, a, b, c, d);
initial begin
 $display ("Exercício K");
 $display ("Úrsula Rosa - 427468");
 $display ("AB CD  S");
 a=0; b=0; c=0; d=0;
 $monitor ("%b%b %b%b  %b",a,b,c,d,s);
 #1 a=0; b=0; c=0; d=1;  
 #1 a=0; b=0; c=1; d=0;
 #1 a=0; b=1; c=0; d=0;
 #1 a=1; b=0; c=0; d=0;
end
endmodule //testS1