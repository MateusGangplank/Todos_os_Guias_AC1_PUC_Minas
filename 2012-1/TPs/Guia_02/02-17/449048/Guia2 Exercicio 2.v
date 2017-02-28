//----------------  PUC MINAS --------------------
//------ Arquitetura de Computadores(2012) -------
//------------- Prof. THELDO ---------------------
//------------  Miller - 449048  -----------------

//-- Guia 2, Exercicio 2

module exercicio_2;

reg [4:0] a; // 5 bits de representacao.
reg [4:0] b; // 5 bits de representacao.
reg [5:0] c; // 6 bits de representacao.
reg [5:0] d; // 6 bits de representacao.
reg [6:0] e; // 7 bits de representacao.
reg [6:0] f; // 7 bits de representacao.
reg [7:0] g; // 8 bits de representacao.
reg [7:0] h; // 8 bits de representacao.
reg [10:0] i; // 11 bits de representacao.
reg [3:0] j; // 4 bits de representacao.
reg [9:0] k; // 10 bits de representacao.
reg [8:0] l; // 9 bits de representacao.

initial begin
$display("Miller - 449048"); 
$display("Exercicio 02 - Guia 02");
$display("");

$display("A) 101010(2) + 11010(2) ");
d = 6'b101010;
a = 5'b11010;
b = d - a;
$display("= %b", b);
$display("");

$display("B) 101010(2) + 25(8) ");
c = 6'b101010;
b = 5'o25;
a = c + b;
$display("= %b", a);
$display("");

$display("C) 1234(8)  /  2B(16) ");
i = 11'o1234;
c = 6'h2b;
j = i/c;
$display("%b", j);
$display("");

$display("D) 1CA(16) – 101110001(2) ");
k = 10'h1ca;
l = 9'b101110001;
f = k - l;
$display("= %b", f );
$display("");

$display("E) 25 * 31(8) + 7A(16) ");
a = 25;
b = 31;
k = a*b;
e = 7'h7a;
k = k + e;

$display("= %b",k);
$display("");
end
endmodule //encerra o modulo exercicio_2.