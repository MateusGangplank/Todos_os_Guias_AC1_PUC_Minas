// ------------------------- 
// Exercicio05 - BASE 
// Nome: Guilherme Moreira Nunes
// Matricula: 408947
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
reg [7:0] a; 
reg [7:0] b; 
reg [7:0] c;  
// ------------------------- parte principal 
initial begin 
$display("Exercicio05 - Guilherme Moreira Nunes - 408947"); 
$display("Complemento de 2"); 
a = 8'b00101010; 
b = 8'b00001101;
c = a - b;
$display("\nLetra A."); 
$display("a = %d = %8b", c, c); 
$display("b = %d = %8b", -c, -c); 

a = 8'b00011010; 
b = 8'b00001101;
c = a - b;
$display("\nLetra B."); 
$display("a = %d = %7b", c, c); 
$display("b = %d = %7b", -c, -c);

a = 8'b00011100; 
b = 8'b00001011;
c = a - b;
$display("\nLetra C."); 
$display("a = %d = %6b", c, c); 
$display("b = %d = %6b", -c, -c); 

a = 8'b11001010; 
b = 8'b10111001;
c = a - b; 
$display("\nLetra D."); 
$display("a = %d = %5b", c, c); 
$display("b = %d = %5b", -c, -c);

a = 8'b00011001; 
b = 8'b00011010;
c = a - b; 
$display("\nLetra E."); 
$display("a = %d = %8b", c, c); 
$display("b = %d = %8b", -c, -c);
end 
endmodule // test_base 