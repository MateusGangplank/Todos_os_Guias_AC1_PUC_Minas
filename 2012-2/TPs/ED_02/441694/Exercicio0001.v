// -------------------------
// Exercicio0001
// Nome: Lucas Cardoso
// Matricula: 441694
// -------------------------
// -------------------------
// test number system
// -------------------------
module test_base_01;
// ------------------------- definir dados
reg [2:0] a;
reg [4:0] b;
reg [5:0] c;

reg [2:0] d;
reg [4:0] e;
reg [5:0] f;

reg [6:0] g;
reg [3:0] h;
reg [3:0] i;

reg [5:0] j;
reg [4:0] k;
reg [4:0] l;

reg [2:0] m;
reg [3:0] n;
reg [3:0] o;
reg [1:0] p;
reg [5:0] q;

// ------------------------- parte principal
initial begin
$display("Exercicio0001 - Lucas Cardoso - 441694");

// a.) 2 + 14
a = 2;
b = 14;
c = a + b;

$display("\n%d + %d = %d = %b", a, b, c, c);

// b.) 3 * 9
d = 3;
e = 9;
f = d*e;

$display("\n%d * %d = %d = %b", d, e, f, f);

// c.) 32 / 5
g = 32;
h = 5;
i = g/h;

$display("\n%d / %d = %d = %b", g, h, i, i);

// d.) 24 – 11
j = 24;
k = 11;
l = j - k;

$display("\n%d - %d = %d = %b", j, k, l, l);

// e.) 2 * 6 + 7 - 1
m = 2;
n = 6;
o = 7;
p = 1;
q = m*n+o-p;

$display("\n%d * %d + %d - %d = %d = %b", m, n, o, p, q, q);

end
endmodule // test_base
