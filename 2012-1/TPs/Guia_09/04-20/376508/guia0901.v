//-------------------------------
// Guia0901 - jk com contador assincrono decrescente
// Nome: Felipe Barros
// Matricula: 376508
// ------------------------------ 



`include "jkff.v"

module guia0901;

reg pulse, clr, entra;
wire a, b, c, d, e, f, g, h, i, j;

jkff jk5 (j, e, entra, entra, pulse, clr);
jkff jk4 (i, d, entra, entra, e, clr);
jkff jk3 (h, c, entra, entra, d, clr);
jkff jk2 (g, b, entra, entra, c, clr);
jkff jk1 (f, a, entra, entra, b, clr);

initial begin

$display ("guia0901");
$display ("teste - contador assincrono decrescente com 5 bits");
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

