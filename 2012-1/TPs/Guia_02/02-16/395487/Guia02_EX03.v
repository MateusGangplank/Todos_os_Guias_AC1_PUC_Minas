// --------------------------------------- 
// Guia 02 - Exercicio 03
// Nome: Alvaro Henrique de Araujo Rungue 
// Matricula: 395487
// ---------------------------------------

module definirRegistradores; 

// --Criar registradores para armazenar os valores:
	reg [5:0] a; 
	reg [4:0] b; 
	reg [4:0] c; 
	reg [5:0] d; 
	reg [3:0] e;
	
	reg [5:0] f;
	reg [4:0] g;
	reg [5:0] h;
	reg [3:0] i;

// ------------------------- parte principal 
initial begin 
	$display("Guia 02 - Exercicio 03 - Alvaro Henrique de Araujo Rungue - 395487"); 
	$display("\n\n\nQuestoes:"); 
	
	a = 6'b100111; 
	b = 5'o23; 
	c = 5'd23;
	d = 6'h2b;
	e = 5'd26 - 6'd36;
	
	//-- Complemento da letra A
	f = ~a + 1'b1;
	$display("\nLetra A:"); 
	$display("%6b complemento de 2 = %6b", a, f); 
	
	//-- Complemento da letra B
	f = ~b + 1'b1;
	$display("\nLetra B:"); 
	$display("%5o complemento de 2 = %5b", b, f); 

	//-- Complemento da letra C	
	g = ~c + 1'b1;
	$display("\nLetra C:"); 
	$display("%5d complemento de 2 = %5b", c, g); 
	
	//-- Complemento da letra D
	h = ~d + 1'b1;
	$display("\nLetra D:"); 
	$display("%6h complemento de 2 = %6b", d, h);
	
	//-- Complemento da letra E
	i = ~e + 1'b1;
	$display("\nLetra E:"); 
	$display("%4d complemento de 2 = %4b", e, i); 

end 

endmodule //-- definirRegistradores; 