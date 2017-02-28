// ------------------------- 
// Exemplo0017 - BASE 
// Nome: Jônatas Sena Ferreira 
// Matricula: 427424 
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
reg [2:0] a; 
reg [9:0] b; 
reg [8:0] c; 
reg [5:0] d; 
// ------------------------- parte principal 
initial begin 
$display("Exemplo0017 - Jônatas Sena Ferreira - 427424");
$display("Exercicio 02"); 


d = 6'b100010 + 5'b11010;
$display("a) 100010(2) + 11010(2) = %d = %6b", d, d);

d = 5'b11010 + 5'o23;
$display("b) 11010(2) + 23(8) = %d = %6b", d, d );


b = 10'o1234 + 6'h2D;
$display("c) 1234(8) / 2D(16) = %d = %10b", b, b);

b = 9'h1A9 - 9'b101101001 ;
$display("d) 1A9(16) - 101101001(2) = %d = %10b", b, b);

b = 5'd25 * 6'o41 + 7'h6B;
$display("e) 25 * 41(8) + 6B(16)  = %d = %10b", b, b);

end 
endmodule // test_base 