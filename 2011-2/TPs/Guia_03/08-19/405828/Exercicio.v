// -------------------------
// Exemplo0012 - BASE
// Nome: Paulo Ricardo B. Souza
// Matricula: 405828
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
reg [3:0] e;
reg [3:0] f;
reg [5:0] g;
reg [5:0] h;
reg [6:0] i;
reg [9:0] j;
reg [7:0] k;
reg [6:0] l;
reg [5:0] m;
reg [4:0] n;
reg [3:0] o;
// ------------------------- parte principal
initial begin
$display("Exemplo0012 - Paulo Ricardo B. Souza - 405828");
$display("Test number system");
a=5;
b=10;
c=15;
d=20;
$display("\nPositive value");
$display("a = %d = %3b", a, a);
$display("b = %d = %4b", a, a);
$display("c = %d = %5b", a, a);
$display("b = %d = %4b", b, b);
$display("c = %d = %5b", c, c);
$display("d = %d = %5b", d, d);
$display("d = %d = %5o", d, d);
$display("d = %d = %5h", d, d);

a = -5;
b = -5;
c = -5;
$display("\nNegative value");
$display("a = -5 [3] = %d = %3b", a, a);
$display("b = -5 [4] = %d = %4b", b, b);
$display("c = -5 [5] = %d = %5b", c, c);

a = ~5+1;
b = ~5+1;
c = ~5+1;
$display("\nNegative mixed expression");
$display("a = %d = %3b", a, a);
$display("b = %d = %4b", b, b);
$display("c = %d = %5b", c, c);

a = 5 + 3;
b = 5 + 3;
c = 10 - 5 + 25 + 3 + 1;
$display("\nOverflow");
$display("a = %d = %3b", a, a);
$display("b = %d = %4b", b, b);
$display("c = %d = %5b", c, c);

$display("\nComplements");
$display("0= %d = %3b = %3b", ~1 , (1-1), ~1 );
$display("1= %d = %3b = %3b", ~0 , (2-1), ~0 );
$display("2= %d = %3b = %3b", (1+1), (3-1), ~0+~0);

c = 2 + 14;
d = 3 * 7;
b = 34 / 3;
f = 19 - 11;
e = 2 * 4 + 6 - 1;
$display("\nExercicio 01");
$display("a = %d = %3b", c, c);
$display("b = %d = %3b", d, d);
$display("c = %d = %3b", b, b);
$display("d = %d = %3b", f, f);
$display("e = %d = %4b", e, e);

g = 6'b100010 + 5'b11010;
h = 5'b11010 + 5'b10011;
b = 10'b1010011100 / 6'b101101;
i = 9'b110101001 - 9'b101101001;
j = 10'b1010110101 + 7'b1101011;
$display("\nExercicio 02");
$display("a = %d = %b", g, g);
$display("b = %d = %b", h, h);
$display("c = %d = %b", b, b);
$display("d = %d = %b", i, i);
$display("e = %d = %b", j, j);

$display("\nExercicio 03");
$display("a = %d = %5b", ~(6'b100111), ~(6'b100111));
$display("b = %d = %5b", ~(6'b101100), ~(6'b101100));
$display("c = %d = %5b", ~13, ~13);
$display("d = %d = %5b", ~(5'b11011), ~(5'b11011));
$display("e = %d = %5b", ~(25-36), ~(25-36));

k = ~53+1;
l = ~41+1;
m = ~11+1;
n = ~179+1;
o = ~(19-25)+1;
$display("\nExercicio 04");
$display("a = %d = %b", k, k);
$display("b = %d = %b", l, l);
$display("c = %d = %b", m, m);
$display("d = %d = %b", n, n);
$display("e = %d = %b", o, o);

end
endmodule // test_base
