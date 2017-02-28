// -------------------------
// Exercicio0002
// Nome: Lucas Cardoso
// Matricula: 441694
// -------------------------
// -------------------------
// test number system
// -------------------------
module test_base_01;
// ------------------------- definir dados
reg [7:0] a;
reg [5:0] b;
reg [7:0] c;

reg [6:0] d;
reg [5:0] e;
reg [6:0] f;

reg [6:0] g;
reg [6:0] h;
reg [1:0] i;

reg [9:0] j;
reg [9:0] k;
reg [7:0] l;

reg [6:0] m;
reg [5:0] n;
reg [7:0] o;
reg [10:0] p;


// ------------------------- parte principal
initial begin
$display("Exercicio0002 - Lucas Cardoso - 441694");

// a.) 101010(2) + 11011(2)
a = 'b101010;
b = 'b11011;
c = a + b;

$display("\n%d + %d = %d = %b", a, b, c, c);

// b.) 11011(2) + 25(8)
d = 'b11011;
e = 'o25;
f = d + e;

$display("\n%d + %d = %d = %b", d, e, f, f);

// 1234(8) / 3C(16)
g = 'o1234;
h = 'h3C;
i = g/h;

$display("\n%d / %d = %d = %b", g, h, i, i);

// d.) 1BA(16) – 101110001(2)
j = 'h1BA;
k = 'b101110001;
l = j - k;

$display("\n%d - %d = %d = %b", j, k, l, l);

// e.) 25 * 32(8) + 7A(16)
m = 25;
n = 'o32;
o = 'h7A;
p = m*n+o;

$display("\n%d * %d + %d = %d = %b", m, n, o, p, p);

end
endmodule // test_base
