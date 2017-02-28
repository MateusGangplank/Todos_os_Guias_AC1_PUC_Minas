//-------------------------------
// Guia0903 - jk com contador decadico decrescente
// Nome: Felipe Barros
// Matricula: 376508
// ------------------------------ 

`include "jkff1.v"

module guia0903;
reg pulse, entra;
wire a, b, c, d, e, a1, b1, c1, d1, e1, na, ne, nc, sand, nentra;

jkff1 jk5 (a, a1, entra, entra, b1, sor);
jkff1 jk4 (b, b1, entra, entra, c1, sor);
jkff1 jk3 (c, c1, entra, entra, d1, sor);
jkff1 jk2 (d, d1, entra, entra, e1, sor);
jkff1 jk1 (e, e1, entra, entra, pulse, sor);
not not1 (nentra, entra);
not nota (na, a1);
not notc (nc, c1);
not note (ne, e1);
and and1 (sand, na, b1, nc, d1, ne);
or or1 (sor, nentra, sand);


initial begin

$display ("guia0903");
$display ("teste - contador decadico decrescente  com 5 bits");
$display ("a , b,  c, d, e ");
$monitor ("%b , %b , %b, %b, %b", a, b, c, d, e );
#1 entra=1; pulse=1; 
#1 entra=1; pulse=0; 
#1 entra=1; pulse=1;
#1 entra=1; pulse=0;
#1 entra=1; pulse=1;
#1 entra=1; pulse=0;
#1 entra=1; pulse=1; 
#1 entra=1; pulse=0;
#1 entra=1; pulse=1;
end
endmodule




