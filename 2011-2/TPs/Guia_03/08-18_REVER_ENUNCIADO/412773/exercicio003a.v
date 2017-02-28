// -------------------------
// Exercicios003A - BASE 
// Nome: Silvino Henrique Santos de Souza
// Matricula: 412773
// ------------------------- 
module EXERCICIO1; 
// ------------------------- definir dados 
reg [4:0] a; 
reg [4:0] b; 
reg [3:0] c; 
reg [3:0] d; 
reg [3:0] e; 
// ------------------------- parte principal 
initial begin 
$display("\nExercicio0031 - Silvino Henrique Santos de Souza - 412773");
$display("Test number system"); 
a = 2 + 14; 
b = 3 * 7; 
c = 34 / 3; 
d = 19 - 11; 
e = 2 * 4 + 6 - 1;
$display("\nPositive value"); 
$display("a = %d = %4b", a, a); 
$display("b = %d = %4b", b, b);
$display("c = %d = %3b", c, c);
$display("d = %d = %3b", d, d);
$display("e = %d = %3b", e, e);
end 
endmodule // EXERCICIO 1
// ------------------------- 
module EXERCICIO2; 
// ------------------------- definir dados 
reg [5:0] a; 
reg [5:0] b; 
reg [3:0] c; 
reg [9:0] d; 
reg [5:0] e; 
// ------------------------- parte principal 
initial begin 
$display("\nExercicio0032 - Silvino Henrique Santos de Souza - 412773");
$display("Test number system"); 
a = 6'b100010 + 5'b11010; 
b = 5'b11010 + 6'o23; 
c = 12'o1234 / 32'h2d; 
d = 48'h1a9 + 9'b101101001; 
e = 6'o25 * 6'o41 + 32'h6b;
$display("\nPositive value"); 
$display("a = %d = %4b", a, a); 
$display("b = %d = %4b", b, b);
$display("c = %d = %3b", c, c);
$display("d = %d = %3b", d, d);
$display("e = %d = %3b", e, e);
end 
endmodule // EXERCICIO 2
// ------------------------- 
module EXERCICIO3; 
// ------------------------- definir dados 
reg [5:0] a; 
reg [5:0] b; 
reg [3:0] c; 
reg [4:0] d; 
reg [3:0] e; 
// ------------------------- parte principal 
initial begin 
$display("\nExercicio0033 - Silvino Henrique Santos de Souza - 412773");
$display("Test number system"); 
a = 6'b100111;
b = 6'o54;
c = 13;
d = 8'h1b;
e = -(25 - 36);
$display("\n1's Complement"); 
$display("a = %d = %6b", a, ~a); 
$display("b = %d = %6b", b, ~b);
$display("c = %d = %4b", c, ~c);
$display("d = %d = %5b", d, ~d);
$display("e = %d = %3b", e, ~e);
end 
endmodule // EXERCICIO 3
// ------------------------- 
module EXERCICIO4; 
// ------------------------- definir dados 
reg [7:0] a; 
reg [6:0] b; 
reg [5:0] c; 
reg [4:0] d; 
reg [3:0] e; 
// ------------------------- parte principal 
initial begin 
$display("\nExercicio0034 - Silvino Henrique Santos de Souza - 412773");
$display("Test number system"); 
a = 8'b110101;
a = ~a;
a = a+1;
b = 7'o51;
b = ~b;
b = b+1;
c = 11;
c = ~c;
c = c+1;
d = 5'hB3;
d = ~d;
d = d+1;
e = (19 - 25);
e = ~e;
e = e+1;
$display("\n2's Complement"); 
$display("a = %d = %8b", a-1, a); 
$display("b = %d = %7b", b-1, b);
$display("c = %d = %6b", c-1, c);
$display("d = %d = %5b", d-1, d);
$display("e = %d = %4b", e-1, e);
end 
endmodule // EXERCICIO 4
// ------------------------- 
module EXERCICIO5; 
// ------------------------- definir dados 
reg [7:0] a; 
reg [6:0] b; 
reg [5:0] c; 
reg [4:0] d; 
reg [3:0] e; 
// ------------------------- parte principal 
initial begin 
$display("\nExercicio0035 - Silvino Henrique Santos de Souza - 412773");
$display("Test number system"); 
a = 8'b10001;
a = ~a;
a = a+1;
b = 7'o64;
b = ~b;
b = b+1;
c = 14;
c = ~c;
c = c+1;
d = 5'hc4;
d = ~d;
d = d+1;
e = (28 - 35);
e = ~e;
e = e+1;
$display("\n2's Complement"); 
$display("a = %8b = %d DEC", a, a); 
$display("b = %7b = %o OCT", b, b);
$display("c = %6b = %h HEX", c, c);
$display("d = %5b = %o OCT", d, d);
$display("e = %4b = %h HEX", e, e);
end 
endmodule //