//-------------------------------
// Guia0901 - jk com contador assincrono crescente
// Nome: Felipe Barros
// Matricula: 376508
// ------------------------------ 

`include "jkff.v"

module guia0902;

reg pulse, clr, entra;
wire a, b, c, d, e, a1, b1, c1, d1, e1;

jkff jk5 (e1, e, entra, entra, pulse, clr);
jkff jk4 (d1, d, entra, entra, e1, clr);
jkff jk3 (c1, c, entra, entra, d1, clr);
jkff jk2 (b1, b, entra, entra, c1, clr);
jkff jk1 (a1, a, entra, entra, b1, clr);






initial begin

$display ("guia0902");
$display ("teste - contador assincrono crescente com 5 bits");
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


