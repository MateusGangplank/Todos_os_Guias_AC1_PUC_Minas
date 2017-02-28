// ------------------------- 
// Guia03_03 - Complemento de 2 
// Nome: Bruno Cezar Andrade Viallet
// Matricula: 396679
// ------------------------- 

module registradores; 
// ------------------------- registradores
reg [5:0] a; 
reg [5:0] b; 
reg [3:0] c; 
reg [4:0] d; 
reg [3:0] e;
reg [5:0] f;
reg [3:0] g;
reg [4:0] h;
reg [3:0] i;

// ------------------------- parte principal 
initial begin 
$display("Guia03_03 - Bruno Cezar Andrad Viallet - 396679"); 
$display("Operaçoes"); 
a = 6'b100111; 
b = 6'o54; 
c = 4'd13;
d = 5'h1b;
e = 5'd25 - 6'd36;
f = ~a;
$display("\nA)"); 
$display("%6b complemento de 2 = %6b", a, f); 
f = ~b;
$display("\nB)"); 
$display("%6o complemento de 2 = %6b", b, f); 
g = ~c;
$display("\nC)"); 
$display("%4d complemento de 2 = %4b", c, g); 
h = ~d;
$display("\nD)"); 
$display("%5h complemento de 2 = %5b", d, h);
i = e;
$display("\nE)"); 
$display("%d complemento de 2 = %4b", e, i); 
end 
endmodule // registradores 