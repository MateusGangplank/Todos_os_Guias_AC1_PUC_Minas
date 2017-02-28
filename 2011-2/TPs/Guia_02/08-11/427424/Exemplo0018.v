// ------------------------- 
// Exemplo0018 - BASE 
// Nome: Jônatas Sena Ferreira 
// Matricula: 427424 
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
reg [3:0] a; 
reg [4:0] b; 
reg [8:0] c; 
reg [5:0] d; 
// ------------------------- parte principal 
initial begin 
$display("Exemplo0018 - Jônatas Sena Ferreira - 427424");
$display("Exercicio 03"); 


d = ~6'b100111 + 1;
$display("a) 100111(2) = %d = %6b", d, d);

d = ~6'o54 + 1;
$display("b) 54(8) = %d = %6b", d, d);

a = ~4'd13 + 1;
$display("c) 13(10) = %d = %6b", a, a);

b = ~5'h1B + 1;
$display("d) 1B(16) = %d = %5b", b, b);

d = (5'd25) + (~6'd36 + 1);
$display("e) 25-36 = %d = %6b", d, d);




end 
endmodule // test_base 