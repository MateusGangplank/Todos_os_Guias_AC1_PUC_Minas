//----------------  PUC MINAS --------------------
//------ Arquitetura de Computadores(2012) -------
//------------- Prof. THELDO ---------------------
//------------  Miller - 449048  -----------------
//-- Guia 2, Exercicio 5

module exercicio_5;

reg [7:0] a; // 8 bits de representacao.
reg [7:0] b; // 8 bits de representacao.
reg [8:0] c; // 9 bits de representacao, se precisar.


initial begin
$display("Miller - 449048"); 
$display("Exercicio 05 - Guia 02");
$display("");

$display("A) 101010(2) – 1101(2)");
a = 6'b101010;
b = 4'b1101;
c = a + (~b+1);
$display("= %b",c );
$display("");

$display("B) 11010(2) – 15(8)");
a = 6'b11010;
b = 4'o15;
c = a + (~b +1);
$display("= %b", c);
$display("");

$display("C) 34(8)  –  B(16)");
a = 7'o34;
b = 4'hb;
c = a + (~b + 1);
$display("= %b", c );
$display("");

$display("D) CA(16) – 10111001(2)");
a = 8'hca;
b = 8'b10111001;
c = a + (~b + 1);
$display("= %b",c );
$display("");

$display("E) 25 - 1A(16)");
a = 25;
b = 5'h1a;
c = a + (~b + 1);
$display("= %b", c);
$display("");
$display("");
$display("- Bom recesso Theldo!!! -");

end
endmodule //encerra o modulo exercicio_5


// OBRIGADO!
