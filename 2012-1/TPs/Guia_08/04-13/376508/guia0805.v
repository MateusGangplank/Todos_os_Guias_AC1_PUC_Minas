//------------------------
// guia0805 - paralelo-serie
// Nome: Felipe Barros
// Matricula: 376508
//------------------------

module dff (output q, output qnot, input d, input clk,input clear,input preset );
reg q, qnot;
initial begin:start
q=0;
end

always @(posedge clk)
if(~clear)
begin
q<=0; qnot<=~q;
end

else
if(preset)
begin
q<=1; qnot<=~q;
end

else
begin
q<=d;
qnot=~q;
end

endmodule // dff

module guia0805;

reg  clk, clr, ld, r0, r1 ,r2 ,r3;
wire a, b, c, d, e, f, g, h, preset0, preset1, preset2, preset3;

and and1 (preset0, ld, r3);
and and2 (preset1, ld, r2);
and and3 (preset2, ld, r1);
and and4 (preset3, ld, r0);

dff d1 (a, e, 0, clk, clr, preset0);
dff d2 (b, f, a, clk, clr, preset1);
dff d3 (c, g, b, clk, clr, preset2);
dff d4 (d, h, c, clk, clr, preset3);

initial begin
$display ("a , b,  c, d" );
$monitor ("%b , %b , %b , %b", a, b, c, d);
#1 ld=0; clk=0; clr=1; r3=0; r2=1; r1=0; r0=0;
#1 ld=1; clk=1; clr=1; r3=0; r2=0; r1=0; r0=0;
#1 ld=1; clk=0; clr=1; r3=0; r2=0; r1=0; r0=0;
#1 ld=1; clk=1; clr=1; r3=0; r2=0; r1=1; r0=1;
#1 ld=1; clk=0; clr=1; r3=0; r2=0; r1=1; r0=0;
#1 ld=1; clk=1; clr=1; r3=0; r2=1; r1=0; r0=1;
#1 ld=1; clk=0; clr=1; r3=0; r2=1; r1=0; r0=0;
#1 ld=1; clk=1; clr=1; r3=0; r2=1; r1=1; r0=1;
#1 ld=1; clk=0; clr=1; r3=0; r2=1; r1=1; r0=0;
#1 ld=1; clk=1; clr=1; r3=1; r2=0; r1=0; r0=1;
#1 ld=1; clk=0; clr=1; r3=1; r2=0; r1=0; r0=0;
#1 ld=1; clk=1; clr=1; r3=1; r2=0; r1=1; r0=1;
#1 ld=1; clk=0; clr=1; r3=1; r2=0; r1=1; r0=0;
#1 ld=1; clk=1; clr=1; r3=1; r2=1; r1=0; r0=1;
#1 ld=0; clk=0; clr=1; r3=1; r2=1; r1=0; r0=0;
#1 ld=1; clk=1; clr=1; r3=1; r2=1; r1=1; r0=1;
#1 ld=0; clk=0; clr=1; r3=1; r2=1; r1=1; r0=0;





end
endmodule