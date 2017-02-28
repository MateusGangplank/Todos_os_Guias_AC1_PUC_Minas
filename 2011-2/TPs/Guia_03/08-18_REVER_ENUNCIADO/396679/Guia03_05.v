// ------------------------- 
// Guia03_05 - Complemento de 2 
// Nome: Bruno Cezar Andrade Viallet
// Matricula: 396679
// ------------------------- 

module registradores; 
// ------------------------- registradores
reg [4:0] a; 
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
$display("Guia03_05 - Bruno Cezar Andrad Viallet - 396679"); 
$display("Operaçoes"); 

a = 5'b10001; 
b = 6'o64; 
c = 4'd14;
d = 8'hc4;
e = 5'd28 - 6'd35;
f = ~a + 1'b1;
$display("\nA)"); 
$display("%6b complemento de 2 = %d", a, f); 
g = ~b + 1'b1;
$display("\nB)"); 
$display("%6b complemento de 2 = %o", b, g); 
h = ~c + 1'b1;
$display("\nC)"); 
$display("%4b complemento de 2 = %h", c, h); 
i = ~d + 1'b1;
$display("\nD)"); 
$display("%8b complemento de 2 = %o", d, i);
j = ~e + 1'b1;
$display("\nE)"); 
$display("%3b complemento de 2 = %h", e, j); 
end 
endmodule // registradores 