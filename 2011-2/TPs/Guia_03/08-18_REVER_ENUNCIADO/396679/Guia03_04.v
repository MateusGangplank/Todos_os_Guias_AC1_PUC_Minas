// ------------------------- 
// Guia03_04 - Complemento de 2 
// Nome: Bruno Cezar Andrade Viallet
// Matricula: 396679
// ------------------------- 

module registradores; 
// ------------------------- registradores
reg [5:0] a; 
reg [5:0] b; 
reg [3:0] c; 
reg [7:0] d; 
reg [2:0] e;
reg [7:0] f;
reg [6:0] g;
reg [5:0] h;
reg [4:0] i;
reg [3:0] j;

// ------------------------- parte principal 
initial begin 
$display("Guia03_04 - Bruno Cezar Andrad Viallet - 396679"); 
$display("Operaçoes"); 
a = 6'b110101; 
b = 6'o51; 
c = 4'd11;
d = 8'hb3;
e = 5'd19 - 5'd25;
f = ~a + 1'b1;
$display("\nA)"); 
$display("%6b complemento de 2 = %8b", a, f); 
g = ~b + 1'b1;
$display("\nB)"); 
$display("%6b complemento de 2 = %7b", b, g); 
h = ~c + 1'b1;
$display("\nC)"); 
$display("%4b complemento de 2 = %6b", c, h); 
i = ~d + 1'b1;
$display("\nD)"); 
$display("%8b complemento de 2 = %5b", d, i);
j = ~e + 1'b1;
$display("\nE)"); 
$display("%3b complemento de 2 = %4b", e, j); 
end 
endmodule // registradores 