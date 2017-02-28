//--------------------------------------------------
//-- Exemplo0034
//-- Nome: Felipe Barros Silva        Matricula: 376508
//---------------------------------------------------



//-- criar module

module guia0035;

//--definir dados

reg a, b;
reg [2:0] c;
wire sand, snand, sor, snor, sxor, sxnor, snot;
wire sand1, sand2, sand3, sand4, sand5, sand6, sand7;
wire snot1, snot2, snot3;

//-- criar portas e curcuito
and and0 (sand, a, b);
nand nand0 (snand, a, b);
or or0 (sor, a, b);
nor nor0 (snor, a, b);
xor xor0 (sxor, a, b);
xnor xnor0 (sxnor, a,b );
not not0 (snot, b);
not not1 (snot1, c[2]);
not not2 (snot2, c[1]);
not not3 (snot3, c[0]);
and and1 (sand1, sand, snot1, snot2, snot3);
and and2 (sand2, snand, snot1, snot2, c[0]);
and and3 (sand3, sor, snot1, c[1], snot3);
and and4 (sand4, snor, snot1, c[1], c[0]);
and and5 (sand5, sxor, c[2], snot2, snot3);
and and6 (sand6, sxnor, c[2], snot2, c[0]);
and and7 (sand7, snot, c[2], c[1], snot3);


//--inicio de execução
initial begin

$display("Exemplo0035 - Felipe Barros  - 376508");
$display("Test LU's module 7 portas");
//-- os registros começam zero
a=0; b=0; c=000;

$display("c    a  b  and  nand  or  nor  xor  xnor  not");
#1 $monitor ("%3b  %b  %b   %b    %b    %b    %b    %b    %b    %b", c, a, b, sand1, sand2, sand3,
 sand4, sand5, sand6, sand7);
 
//--  para and
 #1 c=000; a=0; b=0;
 #1 c=000; a=0; b=1;
 #1 c=000; a=1; b=0;
 #1 c=000; a=1; b=1;
 
//-- para nand
 #1 c=001; a=0; b=0;
 #1 c=001; a=0; b=1;
 #1 c=001; a=1; b=0;
 #1 c=001; a=1; b=1;
 
//-- para or
 #1 c=010; a=0; b=0;
 #1 c=010; a=0; b=1;
 #1 c=010; a=1; b=0;
 #1 c=010; a=1; b=1; 
 
//-- para nor
 #1 c=011; a=0; b=0;
 #1 c=011; a=0; b=1;
 #1 c=011; a=1; b=0;
 #1 c=011; a=1; b=1;
 
//-- para xor
 #1 c=100; a=0; b=0;
 #1 c=100; a=0; b=1;
 #1 c=100; a=1; b=0;
 #1 c=100; a=1; b=1; 
 
 //-- para xnor
 #1 c=101; a=0; b=0;
 #1 c=101; a=0; b=1;
 #1 c=101; a=1; b=0;
 #1 c=101; a=1; b=1;
 
//-- para not
 #1 c=110; a=0; b=0;
 #1 c=110; a=0; b=1;
 
 
 
 
//--fim de execução
end
//--fim de module
endmodule
