//--------------------------------------------------
//-- Exemplo0034
//-- Nome: Felipe Barros Silva        Matricula: 376508
//---------------------------------------------------



//-- criar module

module guia0034;

//--definir dados

reg a, b;
reg [1:0] c;
wire sor, snor, sxor, sxnor, sand3, sand2, sand1, sand0, snot1, snot0;

//-- cria portas e circuito
or or0 (sor, a, b);
nor nor0 (snor, a, b);
xor xor0 (sxor, a, b);
xnor xnor0 (sxnor, a, b);
not not1 (snot1, c[1]);
not not0 (snot0, c[0]);
and and3 (sand3, sor, snot1, snot0);
and and2 (sand2, snor, snot1, c[0]);
and and1 (sand1, sxor, c[1], snot0);
and and0 (sand0, sxnor, c[1], c[0]);

//--começa execução
initial begin

$display("Exemplo0034 - Felipe Barros  - 376508");
$display("Test LU's module or/nor/xor/xnor");
a=0; b=0; c=00;
#1 $display ("c  a  b   OR  NOR  XOR  XNOR");
#1 $monitor ("%2b %b  %b    %b   %b   %b    %b", c, a, b, sand3, sand2, sand1, sand0 );
//-- para OR c=00
#1 c=00; a=0;  b=0;
#1 c=00; a=0;  b=1;
#1 c=00; a=1;  b=0;
#1 c=00; a=1;  b=1;

//-- para XOR c=01
#1 c=01; a=0;  b=0;
#1 c=01; a=0;  b=1;
#1 c=01; a=1;  b=0;
#1 c=01; a=1;  b=1;

//-- para NOR c=10
#1 c=10; a=0;  b=0;
#1 c=10; a=0;  b=1;
#1 c=10; a=1;  b=0;
#1 c=10; a=1;  b=1;

//-- para XNOR c=11
#1 c=11; a=0;  b=0;
#1 c=11; a=0;  b=1;
#1 c=11; a=1;  b=0;
#1 c=11; a=1;  b=1;

//--fim de execução
end

//--fim de modulo
endmodule