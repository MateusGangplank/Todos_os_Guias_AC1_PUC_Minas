// --------------------------------------- 
// Guia 02 - Exercicio 05 
// Nome: Alvaro Henrique de Araujo Rungue 
// Matricula: 395487
// ---------------------------------------

module definirRegistradores;

// --Letra  A
	reg [5:0] a; 
	reg [3:0] b; 
	reg [7:0] c;
	reg [7:0] b2;
	
// -- Letra B	 
	reg [4:0] d; 
	reg [3:0] e;
	reg [7:0] f;
	reg [7:0] e2;
	
// -- Letra C	
	reg [4:0] g;
	reg [3:0] h;
	reg [7:0] i;
	reg [7:0] h2;

// -- Letra D	
	reg [7:0] j;
	reg [7:0] k;
	reg [7:0] l;
	reg [7:0] k2;

// -- Letra  E	
	reg [7:0] m;
	reg [7:0] n;
	reg [7:0] o;
	reg [7:0] n2;

// ------------------------- parte principal 
initial begin 
	$display("Guia 02 - Exercicio 05 - Alvaro Henrique de Araujo Rungue - 395487"); 
	$display("\n\n\n\Questoes:");
	
	//--Letra A
	a = 6'b101010; 
	b = 4'b1101; 
	b2 = ~b + 1'b1;
	c = a - b2;
	$display("\nLetra A:"); 
	$display("%6b - %4b = %8b", a, b2, c);
	
	//--Letra B
	d = 5'b11010; 
	e = 4'b1101; 
	e2 = ~e + 1'b1;
	f = d - e2;
	$display("\nLetra B:"); 
	$display("%5b - %4o = %8b", d, e2, f);
	
	//--Letra C
	g = 5'b11100; 
	h = 4'b1011; 
	h2 = ~h + 1'b1;
	i = g - h2;
	$display("\nLetra C:"); 
	$display("%5b - %4h = %8b", g, h2, i); 
	
	//--Letra D
	j = 8'hca; 
	k = 8'b10111001; 
	k2 = ~k + 1'b1;
	l = j - k2;
	$display("\nLetra D:"); 
	$display("%8h - %8b = %8b", j, k2, l);
	
	//--Letra E
	m = 5'b11001; 
	n = 5'b11010; 
	n2 = ~n + 1'b1;
	o = m - n2;
	$display("\nLetra E:"); 
	$display("%5d - %5b = %8b", m, n2, o);

end 

endmodule //-- definirRegistradores 