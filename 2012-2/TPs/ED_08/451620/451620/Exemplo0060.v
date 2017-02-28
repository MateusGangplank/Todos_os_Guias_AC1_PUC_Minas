//NOME: TIAGO MATTA MACHADO ZAIDAN
//MATRICULA: 451620
//EXEMPLO0060

module dff ( output q, output qnot,
input d, input clk );
reg q, qnot;
always @( posedge clk )
begin
q <= d; qnot <= ~d;
end
endmodule // dff

module Exemplo0060;
reg clock, data;
wire a,b,c,d,anot,bnot,cnot,dnot,enot,tmp;



or or1    ( tmp ,data,a);


dff dff01 ( e, enot, tmp, clock );
dff dff02 ( d, dnot, e, clock );
dff dff03 ( c, cnot, d, clock );
dff dff04 ( b, bnot, c, clock );
dff dff05 ( a, anot, b, clock );
initial
begin
$display ( "Nome: Tiago Matta Machado Zaidan - 451620");
$display ( "data   a  b  c  d  e" );
// initial values
clock = 1;

#1 data = 1;
#10 data = 0;
#100 $finish;
end // initial
always
#5 clock = ~clock;
always @( posedge clock )
begin
$display ( "%b        %b  %b  %b  %b  %b", data, a, b, c, d, e );
end // always at positive edge clocking changing
endmodule // Exemplo0060