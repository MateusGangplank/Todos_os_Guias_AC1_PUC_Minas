// --------------------- 
// Exercicio02-01
// Nome: Lucas Siqueira Chagas	 
// Matricula: 380783
// --------------------- 
// --------------------- 
 module teste_com_numeros; 
// ------------------------- definir dados 
reg [1:0] a; 
reg [3:0] b; 
reg [4:0] c; 
reg [1:0] d; 
reg [3:0] e; 
reg [4:0] f; 
reg [5:0] g; 
reg [1:0] h; 
reg [3:0] i; 
reg [4:0] j; 
reg [3:0] k; 
reg [3:0] l; 
reg [1:0] m; 
reg [2:0] n; 
reg [2:0] o; 
reg [0:0] p;
reg [3:0] q;
initial begin
a = 2;
b = 15;
c = a+b;
$display(" "); 
$display("a = %d = %b", a, a); 
$display("b = %d = %b", b, b); 
$display(" a + b = c"); 
$display("c = %d = %b", c, c); 



d = 3;
e = 8;
f = e*d;
$display(" "); 
$display("d = %d = %b", d, d); 
$display("e = %d = %b", e, e); 
$display(" d * e = f"); 
$display("f = %d = %b", f, f); 

g = 32;
h = 3;
i = g/h;
$display(" "); 
$display("g = %d = %b", g, g); 
$display("h = %d = %b", h, h); 
$display("g / h = i "); 
$display("i = %d = %b", i, i); //fail... what?

j = 21;
k = 11;
l = j-k;
$display(" "); 
$display("j = %d = %b", j, j); 
$display("k = %d = %b", k, k); 
$display(" j - k = l "); 
$display("l = %d = %b", l, l); 

m = 2;
n = 5;
o = 6;
p = 1;
q = m*n+o-p;
$display(" "); 
$display("m = %d = %b", m, m); 
$display("n = %d = %b", n, n); 
$display("o = %d = %b", o, o); 
$display("p = %d = %b", p, p); 
$display("m * n + o - p = q "); 
$display("q = %d = %b", q, q);
 end 
endmodule 