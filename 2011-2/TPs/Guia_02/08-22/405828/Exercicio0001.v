// -------------------------
// Exercicios - BASE
// Nome: Paulo Ricardo B. Souza
// Matricula: 405828
// -------------------------
// -------------------------
// test number system
// -------------------------
module test_base_01;
// ------------------------- definir dados
reg [4:0] a;
reg [4:0] b;
reg [3:0] c;
reg [3:0] d;
reg [3:0] e;
reg [5:0] f;
reg [5:0] g;
reg [3:0] h;
reg [6:0] i;
reg [9:0] j;
// ------------------------- parte principal
initial begin
$display("Exercicios - Paulo Ricardo B. Souza - 405828");
$display("Test number system");
a= 2 + 14;
b= 3 * 7;
c= 34 / 3;
d= 19 - 11;
e= (2 * 4) + 6 - 1;
$display("\nExercicio 01");
$display("a = 2 + 14        = %d = %b", a, a);
$display("b = 3 * 7         = %d = %b", b, b);
$display("c = 34 / 3        = %d = %b", c, c);
$display("d = 19 - 11       = %d = %b", d, d);
$display("e = 2 * 4 + 6 - 1 = %d = %b", e, e);
f= 6'b100010 + 5'b11010;
g= 5'b11010 + 5'b10011;
h= 10'b1010011100 / 6'b101101;
i= 9'b110101001 - 9'b101101001;
j= 25 * 33 + 107;
$display("\nExercicio 02");
$display("a = 100010(2) + 11010(2) = %d = %b", f, f);
$display("b = 11010(2) + 23(8)     = %d = %b", g, g);
$display("c = 1234(8) + 2D(16)     = %d = %b", h, h);
$display("d = 1A9(16) - 101101001  = %d = %b", i, i);
$display("e = 25 * 41(8) + 6B      = %d = %b", j, j);
$display("\nExercicio 03");
$display("a = %d = %b", ~39+1 , ~39+1);
$display("b = %d = %b", ~44+1 , ~44+1);
$display("c = %d = %b", ~13+1 , ~13+1);
$display("d = %d = %b", ~27+1 , ~27+1);
$display("c = %d = %b", ~(25-36)+1 , ~(25-36)+1);
end
endmodule // test_base

