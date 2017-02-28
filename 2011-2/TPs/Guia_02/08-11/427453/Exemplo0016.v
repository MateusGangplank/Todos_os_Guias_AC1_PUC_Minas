
// ------------------------- 
// Exemplo0016 - BASE 
// Nome: Pedro Henrique Vilar Locatelli 
// Matricula: 427453
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
reg [4:0] a; 
reg [4:0] b; 
reg [3:0] c; 
reg [3:0] d;
reg [3:0] e; 
// ------------------------- parte principal 
initial begin 
$display("Exemplo0011 - Pedro Henrique Vilar Locatelli - 427453"); 
$display("Test number system"); 
a = 2 + 14; 
b = 3 * 7; 
c = 34 / 3;
d = 19 - 11;
e = 2 * 4 + 6 - 1 ;
$display("a = %d = %5b", a, a); 
$display("b = %d = %5b", b, b); 
$display("c = %d = %4b", c, c);
$display("d = %d = %4b", d, d);
$display("e = %d = %4b", e, e);
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