// ------------------------- 
// Exemplo0016 - BASE 
// Nome: Jônatas Sena Ferreira 
// Matricula: 427424 
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
$display("Exemplo0016 - Jônatas Sena Ferreira - 427424");
$display("Exercicio 01"); 

d = 2 + 14;
$display("a) %d = %3b", d, d);
c = 3 * 7;
$display("b  %d = %3b", c, c);
b = 34 / 3;
$display("c) %d = %3b", b, b);
d = 19 - 11;
$display("d) %d = %3b", d, d);
b = 2 * 4 + 6 - 1;
$display("e) %d = %3b", b, b);


 

end 
endmodule // test_base 