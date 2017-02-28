// ------------------------- 
// Guia02_01 - Operaçoes 
// Nome: Bruno Cezar Andrade Viallet
// Matricula: 396679
// ------------------------- 

module registradores; 
// ------------------------- A)
reg [2:0] a; 
reg [3:0] b; 
reg [4:0] c; 
// ------------------------- B)
reg [2:0] d; 
reg [3:0] e; 
reg [4:0] f;
// ------------------------- C)
reg [5:0] g; 
reg [2:0] h; 
reg [3:0] i;
// ------------------------- D)
reg [4:0] j; 
reg [3:0] k; 
reg [3:0] l;
// ------------------------- E)
reg [2:0] m; 
reg [2:0] n; 
reg [2:0] o;
reg [2:0] p;
reg [3:0] q;
// ------------------------- parte principal 
initial begin 
$display("Guia02_01 - Bruno Cezar Andrad Viallet - 396679"); 
$display("Operaçoes"); 
a = 2; 
b = 15; 
c = a + b; 
$display("\nA)"); 
$display("%d + %d = %4b", a, b, c); 
d = 3; 
e = 8; 
f = d * e; 
$display("\nB)"); 
$display("%d * %d = %4b", d, e, f);
g = 32; 
h = 3; 
i = g / h; 
$display("\C)"); 
$display("%d / %d = %4b", g, h, i);
j = 21; 
k = 11; 
l = j - k; 
$display("\D)"); 
$display("%d - %d = %4b", j, k, l);
m = 2; 
n = 5; 
o = 6;
p = 1; 
q = m * n + o - p; 
$display("\E)"); 
$display("%d * %d + %d - %d = %4b", m, n, o, p, q);

end 
endmodule // registradores 