// ------------------------- 
// Guia02 Ex05 - Complemento de 2 
// Nome: Marden Santos Batista
// Matricula: 388613	
// ------------------------- 

module registres; 
	reg [5:0] a; 
	reg [3:0] b; 
	reg [7:0] c;
	reg [7:0] c2;
	reg [4:0] d; 
	reg [3:0] e;
	reg [7:0] f;
	reg [7:0] f2;
	reg [4:0] g;
	reg [3:0] h;
	reg [7:0] i;
	reg [7:0] i2;
	reg [7:0] j;
	reg [7:0] k;
	reg [7:0] l;
	reg [7:0] l2;
	reg [7:0] m;
	reg [7:0] n;
	reg [7:0] o;
	reg [7:0] o2;

// ------------------------- Main
initial begin 
	$display("Guia02 Ex05 - Marden Santos Batista- 388613"); 
	//Operations
	$display("Operaçoes"); 
		a = 6'b101010; 
		b = 4'b1101; 
		c2 = ~b + 1'b1;
		c = a - c2;
	$display("\nA)"); 
	$display("%6b - %4b = %8b", a, c2, c);
		d = 5'b11010; 
		e = 4'b1101; 
		f2 = ~e + 1'b1;
		f = d - f2;
	$display("\nB)"); 
	$display("%5b - %4b = %8b", d, f2, f);
		g = 5'b11100; 
		h = 4'b1011; 
		i2 = ~h + 1'b1;
		i = g - i2;
	$display("\nC)"); 
	$display("%5b - %4b = %8b", g, i2, i); 
		j = 8'b11001010; 
		k = 8'b10111001; 
		l2 = ~k + 1'b1;
		l = j - l2;
	$display("\nD)"); 
	$display("%8b - %8b = %8b", j, l2, l);
		m = 5'b11001; 
		n = 5'b11010; 	
		o2 = ~n + 1'b1;
		o = m - o2;
	$display("\nE)"); 
	$display("%5b - %5b = %8b", m, o2, o);
end 

endmodule