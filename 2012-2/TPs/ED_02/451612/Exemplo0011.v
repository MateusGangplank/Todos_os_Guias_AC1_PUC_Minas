// -------------------------
// Exemplo0011 - BASE
// Nome: Rodolfo Herman
// Matricula: 451612
// Versao 1.0
// -------------------------
// -------------------------
// test number system
// -------------------------
module test_base_01;
// ------------------------- definir dados
reg [2:0] a;
reg [3:0] b;
reg [4:0] c;
reg [4:0] d;
// ------------------------- parte principal
initial begin
$display("Exemplo0011 - Rodolfo Herman - 451612");
$display("Test number system");
a = 5;
b = 10;
c = 15;
d = 20;
$display("\nPositive value");
$display("a = %d = %3b", a, a);
$display("b = %d = %4b", a, a);
$display("c = %d = %5b", a, a);
$display("b = %d = %4b", b, b);
$display("c = %d = %5b", c, c);
$display("d = %d = %5b", d, d);
$display("d = %d = %5o", d, d);
$display("d = %d = %5h", d, d);
end
endmodule // test_base

/**
* Documentaçao
*/

/**
* Versao 1.0
* Testar os numeros em representaçoes de 3 a 5 bits, e observar as mudanças causadas.
* Testar os numeros em representaçoes binarias, octais e hexadecimais
*/