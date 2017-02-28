// ------------------------- 
// Exercicio03 - BASE 
// Nome: Guilherme Moreira Nunes
// Matricula: 408947
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
reg [2:0] a; 
reg [3:0] b; 
reg [4:0] c; 
reg [5:0] d; 
// ------------------------- parte principal 
initial begin 
$display("Exercicio03 - Guilherme Moreira Nunes - 408947"); 
$display("Complemento de 2"); 
d = 6'b100111; 
$display("\nLetra A."); 
$display("a = %d = %6b", d, d); 
$display("b = %d = %6b", ~d, ~d); 

c = 5'o23; 
$display("\nLetra B."); 
$display("a = %d = %5b", c, c); 
$display("b = %d = %5b", ~c, ~c);

d = 23; 
$display("\nLetra C."); 
$display("a = %d = %6b", d, d); 
$display("b = %d = %6b", ~d, ~d); 

d = 6'h2b; 
$display("\nLetra D."); 
$display("a = %d = %4b", d, d); 
$display("b = %d = %4b", ~d, ~d);

d = 36;
c = 26; 
b = d-c;
$display("\nLetra E."); 
$display("a = %d = %4b", b, b); 
$display("b = %d = %4b", ~b, ~b);
end 
endmodule // test_base 