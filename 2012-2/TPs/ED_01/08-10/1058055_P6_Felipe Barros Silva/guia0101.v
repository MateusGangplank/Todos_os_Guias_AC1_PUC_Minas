//-------------------------------------------
// Guia0101 - NAND
// Nome: Felipe Barros
// Matricula: 376508
//-------------------------------------------



module portaNand (output s, input a, input b );

assign s=~(a & b);

endmodule

module testePortaNand

reg a, b;
wire s;

nandgate portaNand (s, a, b);
initial begin: start

a=0 b=0;


initial begin

$display ("Guia0101 - Felipe Barros - 376508");
$display ("Test NAND gate");
$display ("\n ~(a&b)= s \n" );
a=0; b=0;



