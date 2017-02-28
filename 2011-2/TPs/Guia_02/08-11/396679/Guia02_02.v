// ------------------------- 
// Guia02_02 - Operaçoes 
// Nome: Bruno Cezar Andrade Viallet
// Matricula: 396679
// ------------------------- 

module registradores; 
// ------------------------- A)
reg [5:0] a; 
reg [4:0] b; 
reg [5:0] c; 
// ------------------------- B)
reg [4:0] d; 
reg [4:0] e; 
reg [5:0] f;
// ------------------------- C)
reg [9:0] g; 
reg [5:0] h; 
reg [3:0] i;
// ------------------------- D)
reg [8:0] j; 
reg [8:0] k;
reg [6:0] l;
// ------------------------- E)
reg [4:0] m; 
reg [5:0] n; 
reg [6:0] o;
reg [9:0] p;
// ------------------------- parte principal 
initial begin 
$display("Guia02_02 - Bruno Cezar Andrad Viallet - 396679"); 
$display("Operaçoes"); 
a = 6'b100010; 
b = 5'b11010; 
c = a + b; 
$display("\nA)"); 
$display("%6b + %6b = %6b", a, b, c); 
d = 5'b11010; 
e = 5'o23; 
f = d + e; 
$display("\nB)"); 
$display("%b + %o = %6b", d, e, f);
g = 10'o1234; 
h = 6'h2d; 
i = g / h; 
$display("\C)"); 
$display("%o / %h = %4b", g, h, i);
j = 9'h1a9; 
k = 9'b101101001; 
l = j - k; 
$display("\D)"); 
$display("%h - %d = %7b", j, k, l);
m = 5'd25; 
n = 6'o41; 
o = 7'h6b;
p =  m * n + o; 
$display("\E)"); 
$display("%d * %o + %h = %10b", m, n, o, p);

end 
endmodule // registradores 