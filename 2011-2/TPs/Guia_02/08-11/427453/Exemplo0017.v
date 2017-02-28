
// ------------------------- 
// Exemplo0017 - BASE 
// Nome: Pedro Henrique Vilar Locatelli 
// Matricula: 427453
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
reg [5:0] a; 
reg [5:0] b; 
reg [3:0] c; 
reg [6:0] d;
reg [9:0] e; 
// ------------------------- parte principal 
initial begin 
$display("Exemplo0011 - Pedro Henrique Vilar Locatelli - 427453"); 
$display("Test number system"); 
a = 6'b100010 + 6'b11010; 
b = 5'b11010 + 5'o23;
c = 1000'o1234 / 1000'h2D;
d = 1000'h1A9 - 9'b101101001; 
e = 25 * 100'o41 + 100'h6B;
$display("a = %d = %6b", a, a); 
$display("b = %d = %6b", b, b); 
$display("c = %d = %4b", c, c);
$display("d = %d = %7b", d, d);
$display("e = %d = %10b", e, e);
end 
endmodule // test_base 
// versao ----------------- data ----------------- alteracao e teste
// 0.1                      09/08/11               (OK). esboco
// 0.2                      09/08/11               (OK). mudanca de versao
// 0.3                      09/08/11               (OK). adicao de testes com soma
// 0.4                      09/08/11               (OK). adicao de testes com overflow
// 0.5                      09/08/11               (OK). adicao de testes com complemento
// 0.6                      09/08/11               (OK). operacoes e armazenamento 
//                                                       de dados em registradores
// 0.7                      09/08/11               (OK). operacoes e armazenamento 
//                                                       de dados em registradores