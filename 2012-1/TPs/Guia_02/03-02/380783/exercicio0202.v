// --------------------- 
// Exercicio02-02
// Nome: Lucas Siqueira Chagas	 
// Matricula: 380783
// --------------------- 
// --------------------- 
 module teste_com_numeros; 
// ------------------------- definir dados 
reg [5:0] a; 
reg [4:0] b; 
reg [6:0] c; 

reg [4:0] d; 
reg [5:0] e; 
reg [5:0] f; 

reg [5:0] g; 
reg [1:0] h; 
reg [3:0] i; 
reg [8:0] j; 
reg [8:0] k; 
reg [3:0] l; 
reg [4:0] m; 
reg [4:0] n; 
reg [6:0] o; 
reg [9:0] q;
initial begin
a = 6'b101010;
b = 5'b11010;
c = a+b;
$display(" "); 
$display("a = %d = %b", a, a); 
$display("b = %d = %b", b, b); 
$display(" a + b = c"); 
$display("c = %d = %b", c, c); 



d = 5'b11010;
e = 6'o25;
f = e+d;
$display(" "); 
$display("d = %d = %b", d, d); 
$display("e = %d = %b", e, e); 
$display(" d + e = f"); 
$display("f = %d = %b", f, f); 

g = 12'o1234;
h = 12'h2B;
i = g/h;
$display(" "); 
$display("g = %d = %b", g, g); 
$display("h = %d = %b", h, h); 
$display("g / h = i "); 
$display("i = %d = %b", i, i); //fail... what?


j = 9'h1CA;
k = 9'b101110001;
l = j-k;
$display(" "); 
$display("j = %d = %b", j, j); 
$display("k = %d = %b", k, k); 
$display(" j - k = l "); 
$display("l = %d = %b", l, l); 


m = 25;
n = 5'o31;
o = 100'h7A;
q = (m*n)+o;
$display(" "); 
$display("m = %d = %b", m, m); 
$display("n = %d = %b", n, n); 
$display("o = %d = %b", o, o); 
$display("m * n + o = q "); 
$display("q = %d = %b", q, q);



end 
endmodule 