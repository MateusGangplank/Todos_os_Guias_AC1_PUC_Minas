
 // ------------------------- 
// Exemplo0017 - BASE 
// Nome: Gustavo Jota Resende 
// Matricula: 427413 
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
reg [5:0] a; 
reg [5:0] b; 
reg [4:0] c; 
reg [6:0] d;
reg [9:0] e; 
// ------------------------- parte principal 
initial begin 
$display("Exemplo0017 - Gustavo Jota Resende - 427413"); 
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


a = 2 + 14;
b = 3 * 7;
c = 34 / 3;
d = 19 - 11;
e = 2 * 4 + 6 - 1; 
 
$display("\nOverflow"); 
$display("Exercicio 01"); 
$display("a = %d = %5b", a, a); 
$display("b = %d = %5b", b, b); 
$display("c = %d = %4b", c, c);
$display("d = %d = %4b", d, d);
$display("e = %e = %4b", e, e);

a = 34 + 26;
b = 26 + 19;
c = 668 / 45; 
d = 425 - 361; 
e = 25 * 33 + 107; 
 
$display("\nOverflow"); 
$display("Exercicio 02"); 
$display("a = %d = %6b", a, a); 
$display("b = %d = %6b", b, b); 
$display("c = %d = %4b", c, c);
$display("d = %d = %7b", d, d);
$display("e = %e = %4b", e, e);
end 
endmodule // test_base 

// Versao Teste 
// 0.1 01. ( OK ) identificacao de programa 
// Resultados: a = 5 = 101, b = 5 =  101, c = 5 =   101, b = 10 = 1010, c = 15 = 01111, d = 20 = 10100, d = 20 =    24, d = 20 =    14
// 0.1 02. ( OK ) identificacao de programa 
// Resultados: a = -5 [3] = 3 = 011, b = -5 [4] = 11 = 1011, c = -5 [5] = 27 = 11011
// 0.1 03. ( OK ) identificacao de programa 
// Resultados: a = 3 = 011, b = 11 = 1011, c = 27 = 11011
// 0.1 04. ( OK ) identificacao de programa 
// Resultados: a = 0 = 000, b =  8 = 1000, c =  2 = 00010
// 0.1 05. ( OK ) identificacao de programa 
// Resultados: 0= -2 =   0 =  10, 1= -1 =  01 =   1, 2=  2 = 010 =  10
// 0.1 06. ( OK ) identificacao de programa 
// Resultados: a = 16 = 10000, b = 21 = 10101, c = 11 = 01011, d =  8 = 01000, e = 1.300000e+001 = 01101
// 0.1 07. ( OK ) identificacao de programa 
// Resultados: a = 60 = 111100, b = 45 = 101101, c = 14 = 01110, d =  64 = 1000000, e = 9.320000e+002 = 1110100100