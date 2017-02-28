// --------------------------------------- 
// Guia 02 - Exercicio 02 
// Nome: Alvaro Henrique de Araujo Rungue 
// Matricula: 395487
// ---------------------------------------

module definirRegistradores;

// --Letra A
reg [5:0] a; 
reg [4:0] b; 
reg [6:0] c; 

// --Letra B
reg [4:0] d; 
reg [4:0] e; 
reg [5:0] f;

// --Letra C
reg [9:0] g; 
reg [5:0] h; 
reg [3:0] i;

// --Letra D
reg [8:0] j; 
reg [8:0] k;
reg [6:0] l;

// --Letra E
reg [4:0] m; 
reg [5:0] n; 
reg [6:0] o;
reg [9:0] p;

// ------------------------- parte principal 
initial begin 
$display("Guia 02 - Exercicio 02 - Alvaro Henrique de Araujo Rungue - 395487"); 
$display("\n\n\nQuestoes:"); 

a = 6'b101010; 
b = 5'b11010; 
c = a + b; 

$display("\nLetra A:"); 
$display("%6b + %6b = %6b", a, b, c); 

d = 5'b11010; 
e = 5'o25; 
f = d + e; 

$display("\nLetra B:"); 
$display("%b + %o = %6b", d, e, f);

g = 10'o1234; 
h = 6'h2b; 
i = g / h; 

$display("\nLetra C:"); 
$display("%o / %h = %4b", g, h, i);
j = 9'h1c9; 
k = 9'b101110001; 
l = j - k; 

$display("\nLetra D:"); 
$display("%h - %b = %7b", j, k, l);
m = 5'd25; 
n = 6'o31; 
o = 7'h7a;
p =  m * n + o; 

$display("\nLetra E:"); 
$display("%d * %o + %h = %10b", m, n, o, p);

end 
endmodule //--DefinirRegistradores