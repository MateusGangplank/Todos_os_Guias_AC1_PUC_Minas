
// ------------------------- 
// Exemplo0015 - BASE 
// Nome: Pedro Henrique Vilar Locatelli 
// Matricula: 427453
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
$display("Exemplo0011 - Pedro Henrique Vilar Locatelli - 427453"); 
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
$display("\nComplements"); 
$display("0= %d = %3b = %3b", ~1 , (1-1), ~1 ); 
$display("1= %d = %3b = %3b", ~0 , (2-1), ~0 ); 
$display("2= %d = %3b = %3b", (1+1), (3-1), ~0+~0);  
end 
endmodule // test_base 
// versao ----------------- data ----------------- alteracao e teste
// 0.1                      09/08/11               (OK). esboco
// 0.2                      09/08/11               (OK). mudanca de versao
// 0.3                      09/08/11               (OK). adicao de testes com soma
// 0.4                      09/08/11               (OK). adicao de testes com overflow
// 0.5                      09/08/11               (OK). adicao de testes com complemento