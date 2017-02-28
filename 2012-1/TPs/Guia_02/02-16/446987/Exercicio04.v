// ------------------------- 
// Exercicio04 - Guia 02 
// Nome: Luhan Mairinck 
// Matricula: 446987 
// ------------------------- 
//
// ------------------------- 
// test number system 
// ------------------------- 

module Complements_2; 
// ------------------------- definir dados 
reg [7:0] a;
reg [6:0] b;
reg [5:0] c;
reg [4:0] d;
reg [7:0] e;

// ------------------------- parte principal
initial begin
$display("Exercicio04 - Luhan Mairinck - 446987");
$display("\nComplemento de 2:");

b = 'b101010;
a = ~b + 1;
$display("A) a = %8b", a);

a = 'b11011;
b = ~a + 1;
$display("B) b = %7b", b);

b = 23;
c = ~b + 1;
$display("C) c = %6b", c);

c = 'hE;
d = ~c + 1;
$display("D) d = %5b", d);


d = 'o26;
e = ~d + 1;
$display("E) e = %8b", e); 

end
endmodule // Complements_2