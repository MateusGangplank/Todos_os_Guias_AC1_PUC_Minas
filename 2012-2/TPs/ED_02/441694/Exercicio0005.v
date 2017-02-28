// -------------------------
// Exercicio0005
// Nome: Lucas Cardoso
// Matricula: 441694
// -------------------------
// -------------------------
// test number system
// -------------------------
module test_base_01;
// ------------------------- definir dados
reg [7:0] a;
reg [7:0] b;
reg [7:0] c;
reg [7:0] d;
reg [7:0] e;
reg [7:0] f;
reg [7:0] g;
reg [7:0] h;
reg [7:0] i;
reg [7:0] j;
reg [7:0] k;
reg [7:0] l;
reg [7:0] m;
reg [7:0] n;
reg [7:0] o;

// ------------------------- parte principal
initial begin
$display("Exercicio0005 - Lucas Cardoso - 441694");

//a.) 101010(2) – 1001(2)
 
a = 'b101010;
b = 'b1001;
// a - b = a + (-b) = a + modulo C2 de b
c = a + (-b);

$display("\na = %d = %b", a, a); 
$display("b = %d = %b", b, b); 
$display("a - b = %d = %b", c, c);
 

// b.) 11011(2) – 15(8)

d = 'b11011;
e = 'o15;
f = d + (-e);

$display("\nd = %d = %b", d, d); 
$display("e = %d = %b", e, e); 
$display("d - e = %d = %b", f, f);

// c.) 34(8) – C(16)

g = 'o34;
h = 'hC;
i = g + (-h);

$display("\ng = %d = %b", g, g); 
$display("h = %d = %b", h, h); 
$display("g - h = %d = %b", i, i);

// d.) DA(16) – 10111001(2)

j = 'hDA;
k = 'b10111001;
l = j + (-k);

$display("\nj = %d = %b", j, j); 
$display("k = %d = %b", k, k); 
$display("j - k = %d = %b", l, l);

// e.) 27 – 1B(16)

m = 27;
n = 'h1B;
o = m + (-n);

$display("\nm = %d = %b", m, m); 
$display("n = %d = %b", n, n); 
$display("m - n = %d = %b", o, o);

end
endmodule // test_base
