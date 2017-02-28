//NOME: TIAGO MATTA MACHADO ZAIDAN
//MATRICULA: 451620
//Exercicio05

module tff ( output q, output qnot,
input t, input clk,
input preset, input clear );
reg q = 0, qnot = 1;
always
begin
#5 if (clear)
begin
q <= 0; qnot <= 1;
end
end

always @( posedge clk )
begin
if ( clear )
begin
q <= 0; qnot <= 1;
end
else
if ( preset )
begin
q <= 1; qnot <= 0;
end
else
begin
if ( t )
begin
q <= ~q; qnot <= ~qnot;
end
end
end

endmodule // tff

module Exercicio05;
reg clear, data,pulse,preset;
wire a,b,c,d,anot,bnot,cnot,dnot,outclear,pre,notdata;
and ( pre, dnot,c,bnot,a );
or ( outclear,clear,pre );
tff tff01 ( d, dnot, pulse,pulse, preset,outclear );
tff tff02 ( c, cnot, dnot,dnot, preset,outclear );
tff tff03 ( b, bnot, cnot,cnot, preset,outclear );
tff tff04 ( a, anot, bnot,bnot, preset,outclear );
initial
begin
$display ( "Nome: Tiago Matta Machado Zaidan - 451620");
$display ( "pulse   a  b  c  d" );
// initial values
clear = 0;
pulse = 1;
preset = 0;

#150 $finish;
end // initial
always
#5 pulse = ~pulse;
always @( posedge pulse )
begin
$display ( "%b         %b  %b  %b  %b",pulse, a,b,c,d);
end
endmodule // Exercicio05