// -------------------------
// Exemplo0014 - BASE
// Nome: Rodolfo Herman
// Matricula: 451612
// Versao 4.0
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
$display("Exemplo0014 - Rodolfo Herman - 451612");
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

a = -5;
b = -5;
c = -5;
$display("\nNegative value");
$display("a = -5 [3] = %d = %3b", a, a);
$display("b = -5 [4] = %d = %4b", b, b);
$display("c = -5 [5] = %d = %5b", c, c);

a = ~5+1;
b = ~5+1;
c = ~5+1;
$display("\nNegative mixed expression");
$display("a = %d = %3b", a, a);
$display("b = %d = %4b", b, b);
$display("c = %d = %5b", c, c);

a = 5 + 3;
b = 5 + 3;
c = 10 - 5 + 25 + 3 + 1;
$display("\nOverflow");
$display("a = %d = %3b", a, a);
$display("b = %d = %4b", b, b);
$display("c = %d = %5b", c, c);
end
endmodule // test_base

/**
* Documentaçao
*/

/**
* Versao 1.0
* Testar os numeros em representaçoes de 3 a 5 bits, e observar as mudanças causadas.
* Testar os numeros em representaçoes binarias, octais e hexadecimais.
*/
/**
* Versao 2.0
* Testar o numero em sua forma negativa e observar a sua representaçao em binario em formato de 3 a 5 bits.
* Verificado que sua representaçao e sempre o complemento 2 ( C2 ) do numero.
*/
/**
* Versao 3.0
* Testar o numero em sua forma de negaçao ( contrapositiva ) em formato binario, em complemento de 2 ( C2 ).
* Verificado que a forma contrapositiva + 1 indica que e o complemento 2 ( C2 ) do numero.
*/
/**
* Versao 4.0
* Testar o numero em sua forma binaria, e verificar o que acontece quando ultrapassa os bits de representaçao.
* Verificado que, quando um numero nao pode ser representado de acordo com os bits necessarios os ou o ultimo bit nao e representado.
*/