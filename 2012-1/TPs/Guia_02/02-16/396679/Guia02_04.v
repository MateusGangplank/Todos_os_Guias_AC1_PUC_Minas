// ------------------------- 
// Guia02_04 - Complemento de 2 
// Nome: Bruno Cezar Andrade Viallet
// Matricula: 396679
// ------------------------- 

module registradores; 
// ------------------------- A)
	reg [5:0] a; 
	reg [10:0] b; 
	reg [4:0] c; 
	reg [3:0] d; 
	reg [4:0] e;
	reg [8:0] f;
	reg [6:0] g;
	reg [5:0] h;
	reg [4:0] i;
	reg [7:0] j;

// ------------------------- parte principal 
initial begin 
	$display("Guia02_04 - Bruno Cezar Andrad Viallet - 396679"); 
	$display("Operaçoes"); 
	a = 6'b101010; 
	b = 1683; //---dafuq 
	c = 5'd23;
	d = 4'he;
	e = 5'o26;
	f = ~a + 1'b1;
	$display("\nA)"); 
	$display("%6b complemento de 2 = %8b 8 bits de comprimento", a, f); 
	g = ~b + 1'b1;
	$display("\nB)"); 
	$display("%11b complemento de 2 = %7b 7 bits de comprimento", b, g); 
	h = ~c + 1'b1;
	$display("\nC)"); 
	$display("%5d complemento de 2 = %6b 6 bits de comprimento", c, h); 
	i = ~d + 1'b1;
	$display("\nD)"); 
	$display("%4h complemento de 2 = %5b 5 bits de comprimento", d, i);
	j = ~e + 1'b1;
	$display("\nE)"); 
	$display("%5o complemento de 2 = %8b 8 bits de comprimento", e, j); 
end 

endmodule // registradores 