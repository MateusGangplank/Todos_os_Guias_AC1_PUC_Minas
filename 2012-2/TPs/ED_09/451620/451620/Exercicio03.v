 //NOME: TIAGO MATTA MACHADO ZAIDAN
//MATRICULA: 451620
//Exercicio03

module jkff ( output q, output qnot,
input j, input k, input clk,input clear );
reg q = 0, qnot = 1;
always
begin
#5 if ( clear )
begin
q <= 1; qnot <= 0;
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

module Exercicio03;
reg pulse, data,clear;
wire a,b,c,d,anot,bnot,cnot,dnot,enot,f,fnot,outclear,out;
nand ( outclear, out, clear );
nand ( out, fnot,e,dnot,c,bnot,a );
jkff jkff01 ( f, fnot, data,data, pulse,outclear );
jkff jkff02 ( e, enot, data,data, fnot,outclear );
jkff jkff03 ( d, dnot, data,data, enot,outclear );
jkff jkff04 ( c, cnot, data,data, dnot,outclear );
jkff jkff05 ( b, bnot, data,data, cnot,outclear );
jkff jkff06 ( a, anot, data,data, bnot,outclear );
initial
begin
$display ( "Nome: Tiago Matta Machado Zaidan - 451620");
$display ( "clear  data    a  b  c  d  e  f" );
// initial values
pulse = 1;
clear = 1;

#10 data = 1;
#10 data = 1;
#10 data = 0;
#10 data = 1;
#10 data = 1;
#10 data = 1;
#10 clear = 0;
#10 clear = 1;
#60 $finish;
end // initial
always
#5 pulse = ~pulse;
always @( posedge pulse )
begin
$display ( "%b         %b        %b  %b  %b  %b  %b  %b",clear, data, a, b, c, d, e, f );
end
endmodule // Exercicio03