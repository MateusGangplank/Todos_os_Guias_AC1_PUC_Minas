//------------------------
// guia08 - SRL com carga inicial em todos os estágios
// Nome: Felipe Barros
// Matricula: 376508
//------------------------

`include "dff.v"
module guia0802;

reg data, clk, clr;
wire a, b, c, d, e, f, g, h;

dff d1 (d, e, data, clk, clr);
dff d2 (c, f, data, clk, clr);
dff d3 (b, g, data, clk, clr);
dff d4 (a, h, data, clk, clr);

initial begin

$display ("guia08 02");
$display ("test SRL com carga inicial em todos estagios");
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
#1 data=1; clk=1; clr=1;
end
endmodule



