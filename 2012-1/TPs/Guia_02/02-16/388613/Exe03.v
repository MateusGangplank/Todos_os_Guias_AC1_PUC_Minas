// ------------------------- 
// Guia02 Ex03 - Complemento de 2 
// Nome: Marden Santos Batista
// Matricula: 388613
// ------------------------- 

module registres; 
	reg [5:0] a; 
	reg [4:0] b; 
	reg [4:0] c; 
	reg [5:0] d; 
	reg [3:0] e;
	reg [5:0] f;
	reg [4:0] g;
	reg [5:0] h;
	reg [3:0] i;

// ------------------------- Main
initial begin 
	$display("Guia02 Ex03 - Marden Santos Batista- 388613"); 
	//Operations
	$display("Opera�oes"); 
		a = 6'b100111; 
		b = 5'o23; 
		c = 5'd23;
		d = 6'h2b;
		e = 5'd26 - 6'd36;
		f = ~a + 1'b1;
	$display("\nA)"); 
	$display("%6b complemento de 2 = %6b", a, f); 
		f = ~b + 1'b1;
	$display("\nB)"); 
	$display("%5o complemento de 2 = %5b", b, f); 
		g = ~c + 1'b1;
	$display("\nC)"); 
	$display("%5d complemento de 2 = %5b", c, g); 
		h = ~d + 1'b1;
	$display("\nD)"); 
	$display("%6h complemento de 2 = %6b", d, h);
		i = ~e + 1'b1;
	$display("\nE)"); 
	$display("%4d complemento de 2 = %4b", e, i); 
end 
endmodule