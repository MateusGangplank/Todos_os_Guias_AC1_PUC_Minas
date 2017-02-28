// ------------------------
// ExercicioL
// Aluna: Úrsula Rosa Monteiro de Castro
// Matricula: 427468
// ------------------------

module calculaS0(output s, input a, input b, input c, input d);
wire [1:0] sNot;
wire sAnd;
wire sOr;

not NOT1 (sNot[0], a);
not NOT2 (sNot[1], b);

and AND1 (sAnd, sNot[1], d);
or OR1 (sOr, sAnd, c);
and AND2 (s, sNot[0], sOr);
endmodule //calculaS0

module modS0(output [3:0] s, input [3:0] a,  input [3:0] b, input [3:0] c, input [3:0] d);
calculaS0 c1(s[0], a[0], b[0], c[0], d[0]);
calculaS0 c2(s[1], a[1], b[1], c[1], d[1]);
calculaS0 c3(s[2], a[2], b[2], c[2], d[2]);
calculaS0 c4(s[3], a[3], b[3], c[3], d[3]);
endmodule //modS0

module testS1;

reg [3:0] a;
reg [3:0] b;
reg [3:0] c;
reg [3:0] d;
wire [3:0] s;
modS0 testeS0 (s, a, b, c, d);
initial begin
 $display ("Exercício L");
 $display ("Úrsula Rosa - 427468");
 $display ("A      B    C    D    S");
 a=4'b0000; b=4'b0000; c=4'b0000; d=4'b0000;
 $monitor ("%b %b %b %b  %b",a,b,c,d,s);
  #1 a=4'b0001; b=4'b0000; c=4'b0000; d=4'b1100;
  #1 a=4'b0001; b=4'b0010; c=4'b0011; d=4'b0001;
  #1 a=4'b0001; b=4'b1000; c=4'b0111; d=4'b0011;
  #1 a=4'b0001; b=4'b0100; c=4'b0010; d=4'b1111;
end
endmodule //testS1