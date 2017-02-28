
// ------------------------- 
// Exemplo0018 - BASE 
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
a = ~6'b100111 + 1'b1; 
b = ~7'o54 + 1'o1;
c = ~13 + 1;
d = ~100'h1B + 1'h1; 
e = ~25 - 36 + 1;
$display("a = %d = %6b", a, a); 
$display("b = %d = %2o", b, b); 
$display("c = %d = %1d", c, c);
$display("d = %d = %2h", d, d);
$display("e = %d = %3d", e, e);
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
// 0.8                      09/08/11               (OK). operacoes e armazenamento 
//                                                       de dados em registradores