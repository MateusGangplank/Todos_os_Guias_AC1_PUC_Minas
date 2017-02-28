//-------------------------------
// Guia0904 - jk com contador modulo 8
// Nome: Felipe Barros
// Matricula: 376508
// ------------------------------ 


`include "tff.v"

module guia0905;

reg pulse, clr;
wire a, b, c, d, a1, b1, c1, d1, na, nb, nc, sand, sor;

tff t1 (d, d1, c1, c1, sor);
tff t2 (c, c1, b1, b1, sor);
tff t3 (b, b1, a1, a1, sor);
tff t4 (a, a1, pulse, pulse, sor);
not nota (na, a);
not notb (nb, b);
not notc (nc, c);
and and1 (sand, na, nb, nc, d);
or or1 (sor, sand, clr);

initial begin

$display ("guia0905");
$display ("teste - contador module 8");
$display ("a , b,  c, d");
$monitor ("%b , %b , %b, %b", a, b, c, d);
#1  pulse=1; clr=0;
#1  pulse=0; clr=0;
#1  pulse=1; clr=0;
#1  pulse=0; clr=0;
#1  pulse=1; clr=0;
#1  pulse=0; clr=0;
#1  pulse=1; clr=0;
#1  pulse=0; clr=0;
#1  pulse=1; clr=0;
end


endmodule