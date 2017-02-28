//-------------------------------
// Guia0904 - jk com contador decadico crescente
// Nome: Felipe Barros
// Matricula: 376508
// ------------------------------ 

`include "jkff.v"

module guia0904;

reg pulse, entra, clr;
wire a, b, c, d, e, a1, b1, c1, d1, e1, nb, nd, sand1, sand2;

jkff jk5 (a, a1, entra, entra, b1,sand2);
jkff jk4 (b, b1, entra, entra, c1, sand2);
jkff jk3 (c, c1, entra, entra, d1, sand2);
jkff jk2 (d, d1, entra, entra, e1, sand2);
jkff jk1 (e, e1, entra, entra, pulse, sand2);

not notb (nb, b);
not notd (nd, d);
and and1 (sand1, e, nd, c, nb, a);
and and2 (sand2, clr, sand1);

initial begin

$display ("guia0904");
$display ("teste - contador decadico crescente com 5 bits");
$display ("a , b,  c, d, e ");
$monitor ("%b , %b , %b, %b, %b", a, b, c, d, e );
#1 entra=1; pulse=1; clr=0;
#1 entra=1; pulse=0; clr=0;
#1 entra=1; pulse=1; clr=0;
#1 entra=1; pulse=0; clr=0;
#1 entra=1; pulse=1; clr=0;
#1 entra=1; pulse=0; clr=0;
#1 entra=1; pulse=1; clr=0;
#1 entra=1; pulse=0; clr=0;
#1 entra=1; pulse=1; clr=0;
end


endmodule