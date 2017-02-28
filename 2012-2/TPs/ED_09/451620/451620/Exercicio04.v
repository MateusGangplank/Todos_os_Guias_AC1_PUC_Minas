//NOME: TIAGO MATTA MACHADO ZAIDAN
//MATRICULA: 451620
//Exercicio04

module jkff ( output q, output qnot,
input j, input k, input clk,input clear, input preset );
reg q = 0, qnot = 1;
always
begin
#5 if ( clear )
begin
q <= 0; qnot <= 1;
end
else
if ( preset )
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
else
if ( ~preset )
begin
q <= 1; qnot <= 0;
end
end
endmodule // jkff

module Exercicio04;
reg pulse, data;
wire a,b,c,d,anot,bnot,cnot,dnot,enot,f,fnot,outclear,preset,pre,notdata;
and ( pre, fnot,e,dnot,c,bnot,a );
not (notdata,data);
or ( preset,pre,notdata );
jkff jkff01 ( f, fnot, data,data, pulse,outclear,preset );
jkff jkff02 ( e, enot, data,data, f,outclear,preset );
jkff jkff03 ( d, dnot, data,data, e,outclear,preset );
jkff jkff04 ( c, cnot, data,data, d,outclear,preset );
jkff jkff05 ( b, bnot, data,data, c,outclear,preset );
jkff jkff06 ( a, anot, data,data, b,outclear,preset );
initial
begin
$display ( "Nome: Tiago Matta Machado Zaidan - 451620");
$display ( "data    a  b  c  d  e  f" );
// initial values
pulse = 1;

#10 data = 1;
#10 data = 1;
#10 data = 1;
#10 data = 1;
#10 data = 0;
#10 data = 1;
#60 $finish;
end // initial
always
#5 pulse = ~pulse;
always @( posedge pulse )
begin
$display ( "%b        %b  %b  %b  %b  %b  %b", data, a, b, c, d, e, f );
end
endmodule // Exercicio04