// --------------------------- 
// Guia02 Ex04 - Complemento de 2 
// Nome: Marden Santos Batista
// Matricula: 388613
// ---------------------------

module registres; 
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

// ------------------------- Main
initial begin 
	$display("Guia02 Ex04 - Marden Santos Batista- 388613"); 
	//Operations
	$display("Operaçoes"); 
		a = 6'b101010; 
		b = 1683;
		c = 5'd23;
		d = 4'he;
		e = 5'o26;
		f = ~a + 1'b1;
	$display("\nA)"); 
	$display("%6b complemento de 2 = %8b 8 bits", a, f); 
		g = ~b + 1'b1;
	$display("\nB)"); 
	$display("%11b complemento de 2 = %7b 7 bits", b, g); 
		h = ~c + 1'b1;
	$display("\nC)"); 
	$display("%5d complemento de 2 = %6b 6 bits", c, h); 
		i = ~d + 1'b1;
	$display("\nD)"); 
	$display("%4h complemento de 2 = %5b 5 bits ", d, i);
		j = ~e + 1'b1;
	$display("\nE)"); 
	$display("%5o complemento de 2 = %8b 8 bits", e, j); 
end 
endmodule
