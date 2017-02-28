// ------------------------- 
// Exercicio004 - BASE 
// Nome: Marcio Santana Correa
// Matricula: 345368
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
reg [4:0] a; 
reg [5:0] b; 
reg [6:0] c; 
reg [7:0] d; 
// ------------------------- parte principal 
initial begin 
$display("Exercicio04 - Marcio Santana Correa"); 
$display("Complemento de 2"); 
d = 6'b101010; 
$display("\nLetra A."); 
$display("a = %d = %8b", d, d); 
$display("b = %d = %8b", -d, -d); 

c = 7'b0001011; 
$display("\nLetra B."); 
$display("a = %d = %7b", c, c); 
$display("b = %d = %7b", -c, -c);

b = 6'd23; 
$display("\nLetra C."); 
$display("a = %d = %6b", b, b); 
$display("b = %d = %6b", -b, -b); 

a = 5'he; 
$display("\nLetra D."); 
$display("a = %d = %5b", a, a); 
$display("b = %d = %5b", -a, -a);

d = 8'o26;
$display("\nLetra E."); 
$display("a = %d = %8b", d, d); 
$display("b = %d = %8b", -d, -d);
end 
endmodule // test_base 