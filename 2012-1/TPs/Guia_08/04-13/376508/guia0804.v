//------------------------
// guia0804 - SRD com carga inicial em todos estagios
// Nome: Felipe Barros
// Matricula: 376508
//------------------------

´include "dff.v";
module SRD1;

reg data, clk, clr;
wire a, b, c, d, e, f, g, h;

dff d1 (a, e, data, clk, clr);
dff d2 (b, f, data, clk, clr);
dff d3 (c, g, data, clk, clr);
dff d4 (d, h, data, clk, clr);
initial begin
$display ("guia08 03");
$display ("test SRD com carga unitária");
//data=0; clk=0; clr=0;
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
#1 data=1; clk=1; clr=1;end
endmodule

