// --------------------------------------- 
// Guia 02 - Exercicio 04
// Nome: Alvaro Henrique de Araujo Rungue 
// Matricula: 395487
// ---------------------------------------

module definirRegistradores;

//--Exercicio 4
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

	$display("Guia 02 - Exercicio 04 - Alvaro Henrique de Araujo Rungue - 395487"); 
	$display("\n\n\n\Questoes:");
	
	a = 6'b101010; 
	b = 1683; //---dafuq 
	c = 5'd23;
	d = 4'he;
	e = 5'o26;
	
	//-- Calculando coplemento de 2 da letra A com 8 bits de comprimento
	f = ~a + 1'b1;
	$display("\nLetra A:"); 
	$display("%6b complemento de 2 = %8b 8 bits de comprimento", a, f); 
	
	//-- Calculando coplemento de 2 da letra B com 7 bits de comprimento
	g = ~b + 1'b1;
	$display("\nLetra B:"); 
	$display("%11b complemento de 2 = %7b 7 bits de comprimento", b, g); 
	
	//-- Calculando coplemento de 2 da letra C com 6 bits de comprimento
	h = ~c + 1'b1;
	$display("\nLetra C:"); 
	$display("%5d complemento de 2 = %6b 6 bits de comprimento", c, h); 

	//-- Calculando coplemento de 2 da letra D com 5 bits de comprimento
	i = ~d + 1'b1;
	$display("\nLetra D:"); 
	$display("%4h complemento de 2 = %5b 5 bits de comprimento", d, i);

	//-- Calculando coplemento de 2 da letra E com 8 bits de comprimento
	j = ~e + 1'b1;
	$display("\nLetra E:"); 
	$display("%5o complemento de 2 = %8b 8 bits de comprimento", e, j); 
	
end 

endmodule //-- definirRegistradores 