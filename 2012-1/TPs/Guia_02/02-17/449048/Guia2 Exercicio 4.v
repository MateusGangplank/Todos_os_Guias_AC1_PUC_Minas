//----------------  PUC MINAS --------------------
//------ Arquitetura de Computadores(2012) -------
//------------- Prof. THELDO ---------------------
//------------  Miller - 449048  -----------------
//-- Guia 2, Exercicio 4

module exercicio_4;

reg [4:0] a; // 5 bits de representacao.
reg [5:0] b; // 6 bits de representacao.
reg [6:0] c; // 7 bits de representacao.
reg [7:0] d; // 8 bits de representacao.

initial begin
$display("Miller - 449048"); 
$display("Exercicio 04 - Guia 02");
$display("");

$display("A) 101010(2)");
d = 8'b101010;
d = ~d + 1;
$display("= %b", d);
$display("");

$display("B) 123(4)");
a = 27;
a = ~a + 1;
$display("= %b", a );
$display("");

$display("C) 23(10)");
b = 23;
b = ~b + 1;
$display("= %b", b);
$display("");

$display("D) E(16)");
a = 5'he;
a = ~a + 1;
$display("= %b", a);
$display("");

$display("E) 26(8)");
d = 8'o26;
d = ~d + 1;
$display("= %b", d);
$display("");
end
endmodule //encerra o modulo exercicio_4.

//-- Theldo,
//-- Nao entendi na letra B a respeito do numero na base 4, tem como converter como se fosse um
//-- hexadecimal que a gente coloca um  h  ?
//-- Eu mesmo converti, e mostrei o complemento em binario. Comente por favor.



//-- Atribuindo o sinal negativo no binario, ja colocamos em complemento de 2, ex.:
//-- a = 4'1010   ==>   1010   ,    a = -4'1010  ==> 0110 (complemento de 2)