//--------------------------------------------------
//-- Exemplo0033
//-- Nome: Felipe Barros Silva        Matricula: 376508
//---------------------------------------------------


//-- criar module
module guia0033;

//--definir os dados

reg a, b, c;
wire sand, sor, snand, snor, s3, s2, s1, s0, snot;
nand nand0 (snand, a, b);
nor nor0 (snor, a, b);
and and0 (sand, a, b);
or or0 (sor, a, b);
not not0 (nsot, c);
and and1 (s3, snand, c);
and and2 (s2, snor, c);
and and3 (s1, sand,nsot);
and and4 (s0, sor, nsot);

//-- execuça programa

initial begin

$display("Exemplo0033 - Felipe Barros  - 376508");
$display("Test LU's module and/or e nand/nor");
a=0; b=0; c=0;
$display("c a  b nand  nor  and  or");
#1 $monitor("%b %b  %b   %b   %b     %b    %b",c,a,b, s3, s2, s1, s0);
#1 c = 0; a = 0; b =0;
#1 c = 0; a = 0; b =1;
#1 c = 0; a = 1; b =0;
#1 c = 0; a = 1; b =1;
#1 c = 1; a = 0; b =0;
#1 c = 1; a = 0; b =1;
#1 c = 1; a = 1; b =0;
#1 c = 1; a = 1; b =1;


end
endmodule