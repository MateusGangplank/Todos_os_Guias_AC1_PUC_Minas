//----------------  PUC MINAS --------------------
//------ Arquitetura de Computadores(2012) -------
//------------- Prof. THELDO ---------------------
//------------  Miller - 449048  -----------------

//-- Guia 2, Exercicio 1

module exercicio_1;

reg [0:0] a; // 1 bit de representacao.
reg [1:0] b; // 2 bits de representacao.
reg [2:0] c; // 3 bits de representacao.
reg [3:0] d; // 4 bits de representacao.
reg [4:0] e; // 5 bits de representacao.
reg [5:0] f; // 6 bits de representacao.

initial begin
$display("Miller - 449048"); 
$display("Exercicio 01 - Guia 02");
$display("");

$display("A)");
$display("2 + 15");
b = 2;
d = 15;
e = b + d;
$display("= %b (2)", e);
$display("");

$display("B)");
$display("3 * 8");
b = 3;
d = 8;
e = b*d;
$display("= %b (2)", e);
$display("");

$display("C)");
$display("32 / 3");
f = 32;
b = 3;
d = 32/3;
$display("= %b (2)", f);
$display("");

$display("D)");
$display("21 - 11");
d = 11;
f = 21;
e = f - d;
$display("= %b (2)", e);
$display("");

$display("E)");
$display("2 * 5 +6 - 1");
d = 2 * 5;
c = 6 - 1;
e = d + c;
$display("= %b (2)", e);
$display("");



end
endmodule //encerra o modulo exercicio_1.