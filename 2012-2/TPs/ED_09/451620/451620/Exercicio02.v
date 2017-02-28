//NOME: TIAGO MATTA MACHADO ZAIDAN
//MATRICULA: 451620
//Exercicio02

module jkff ( output q, output qnot,
input j, input k, input clk,input clear );
reg q = 0, qnot = 1;
always
begin
#5 if ( clear )
begin
q <= 0; qnot <= 1;
end
end
always @( posedge clk )
begin
if ( j & ~k )
begin
q <= 1; qnot <= 0;
end
else
if ( ~j & k )
begin
q <= 0; qnot <= 1;
end
else
if ( j & k )
begin
q <= ~q; qnot <= ~qnot;
end
else 
if ( ~clear )
begin
q <= 0; qnot <= 1;
end
end
endmodule // jkff

module Exercicio02;
reg pulse, data,clear;
wire a,b,c,d,anot,bnot,cnot,dnot,enot;
jkff jkff01 ( e, enot, data,data, pulse,clear );
jkff jkff02 ( d, dnot, data,data, e,clear );
jkff jkff03 ( c, cnot, data,data, d,clear );
jkff jkff04 ( b, bnot, data,data, c,clear );
jkff jkff05 ( a, anot, data,data, b,clear );
initial
begin
$display ( "Nome: Tiago Matta Machado Zaidan - 451620");
$display ( "clear  data    a  b  c  d  e" );
// initial values
pulse = 1;
clear = 0;

#10 data = 1;
#10 data = 1;
#10 data = 1;
#10 data = 1;
#10 data = 0;
#10 data = 1;
#10 clear = 1;
#10 clear = 0;
#60 $finish;
end // initial
always
#5 pulse = ~pulse;
always @( posedge pulse )
begin
$display ( "%b         %b        %b  %b  %b  %b  %b",clear, data, anot, bnot, cnot, dnot, enot );
end
endmodule // Exercicio02