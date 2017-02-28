// ------------------------- 
// Exercicio05 - Guia 02 
// Nome: Luhan Mairinck 
// Matricula: 446987 
// ------------------------- 
//
// ------------------------- 
// test number system 
// ------------------------- 

module Sub_Complement2; 
// ------------------------- definir dados 
reg [7:0] a;
reg [7:0] b;
reg [7:0] c;
reg [7:0] d;
reg [7:0] e;

// ------------------------- parte principal
initial begin
$display("Exercicio05 - Luhan Mairinck - 446987");
$display("\nSubtracao com Complemento de 2:");

b = 'b101010;
c = 'b1101;
a = b + (~c + 1);
$display("A) a = %8b", a);

a = 'b11010;
c = 'o15;
b = a + (~c + 1);
$display("B) b = %8b", b);

b = 'o34;
d = 'hB;
c = b + (~d + 1);
$display("C) c = %8b", c);

c = 'hCA;
e = 'b10111001;
d = c + (~e + 1);
$display("D) d = %8b", d);


d = 25;
c = 'h1A;
e = d + (~c + 1);
$display("E) e = %8b", e); 

end
endmodule // Sub_Complement2