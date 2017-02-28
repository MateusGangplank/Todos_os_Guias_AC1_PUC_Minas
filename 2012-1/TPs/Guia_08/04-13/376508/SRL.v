//------------------------
//Guia0801 - SRL
//Nome: Felipe Barros
//Matricula: 376508
//------------------------


`include "dff.v"
module SRLD;

reg data, clk, clr;
wire a, b, c, d,e,f,g,h;

dff d1 (d, e, data, clk, clr);
dff d2 (c, f, d, clk, clr);
dff d3 (b, g, c, clk, clr);
dff d4 (a, h, b, clk, clr);

initial begin
$display ("guia08 01");
$display ("test SRL com carga unitária");
//data=0; clk=0; clr=1;
$display ("a , b,  c, d" );
$monitor ("%b , %b , %b , %b", a, b, c, d);
#1 data=0; clk=0; clr=1;
#1 data=0; clk=1; clr=1;
#1 data=1; clk=0; clr=1;
#1 data=1; clk=1; clr=1;
#1 data=0; clk=0; clr=1;
#1 data=0; clk=1; clr=1;
#1 data=1; clk=0; clr=1;
#1 data=1; clk=1; clr=1;
#1 data=0; clk=0; clr=1;
#1 data=1; clk=1; clr=1;
#1 data=1; clk=0; clr=1;
#1 data=1; clk=1; clr=1;
#1 data=0; clk=0; clr=1;
#1 data=1; clk=1; clr=1;
#1 data=1; clk=0; clr=1;
#1 data=1; clk=1; clr=1;

end
endmodule




