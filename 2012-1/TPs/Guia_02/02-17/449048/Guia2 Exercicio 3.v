//----------------  PUC MINAS --------------------
//------ Arquitetura de Computadores(2012) -------
//------------- Prof. THELDO ---------------------
//------------  Miller - 449048  -----------------

//-- Guia 2, Exercicio 3

module exercicio_3;

reg [4:0] a; // 5 bits de representacao.
reg [4:0] b; // 5 bits de representacao.
reg [5:0] c; // 6 bits de representacao.
reg [5:0] d; // 6 bits de representacao.
reg [6:0] e; // 7 bits de representacao.

initial begin
$display("Miller - 449048"); 
$display("Exercicio 03 - Guia 02");
$display("");

$display("A) 100111(2)");
d = 6'b100111;
e = ~d;
c = e + 1;
$display("= %b", c);
$display("");

a = 5'o23;
b = ~a;
a = b + 1;
$display("B) 23 (8)");
$display("= %4b", a);
$display("");

a = 23;
b = (~a + 1);
$display("C) 23 (10)");
$display("= %4b", b);
$display("");

c = 6'h2b;
d = ~c;
c = d + 1;
$display("D) 2B (16)");
$display("= %5b", c);
$display("");

$display("E) 26 - 36");
b = 26;
c = 36;
a = b - c; // tera um bit no inicio representando o sinal.

$display("= %b", a);


end
endmodule //encerra o modulo exercicio_3.

//-- Atribuir valor binario/ octal / hexadecimal:
//-- variavel/registrador = (numero de bits) (') (b/o/h) (valor em b/o/h)
//-- b = binario, h = hexadecimal, o = octal.
//-- ex. 25 base 8 =    x = 5'o25; 5 bits 11001, ' , o , valor 25.