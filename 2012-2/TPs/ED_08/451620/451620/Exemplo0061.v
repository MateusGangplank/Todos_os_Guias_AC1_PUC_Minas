//NOME: TIAGO MATTA MACHADO ZAIDAN
//MATRICULA: 451620
//EXEMPLO0061

module dff ( output q, output qnot,
input d, input clk,input x );
reg q, qnot;

initial begin
q <= x; qnot <= ~x;
end
always @( posedge clk )
begin
q <= d; qnot <= ~d;
end
endmodule // dff

module Exemplo0061;
reg clock, data;
wire a,b,c,d,e,anot,bnot,cnot,dnot,enot,tmp;


dff dff01 ( a, anot, data, clock,1 );

dff dff02 ( b, bnot, a, clock,0 );
dff dff03 ( c, cnot, b, clock,1 );
dff dff04 ( d, dnot, c, clock,0 );
dff dff05 ( e, enot, d, clock,0 );
initial
begin
$display ( "Nome: Tiago Matta Machado Zaidan - 451620");
$display ( "data   a  b  c  d  e" );
// initial values
clock = 1;

#1 data = 0;
#100 $finish;
end // initial
always
#5 clock = ~clock;
always @ ( posedge clock )
begin
$display ( "%b        %b  %b  %b  %b  %b", data, a, b, c, d, e );
end // always at positive edge clocking changing
endmodule // Exemplo0061