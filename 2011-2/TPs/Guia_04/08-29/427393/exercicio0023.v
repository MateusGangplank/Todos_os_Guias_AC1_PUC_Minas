// ------------------------- 
// Exemplo0023 - COMPARADOR IGUALDADE 
// Nome: Camila Guedes Silveira 
// Matricula: 427393 
// ------------------------- 

// ------------------------- 
// Comparador de Igualdade
// ------------------------- 

module comparadorI (output [5:0]s, input [5:0]a, input [5:0]b); 
	// descrever por portas 
	
	assign s = ~(a ^ b);
	
endmodule // comparadorI 

module test_comparadorI; 
// ------------------------- definir dados 
	reg [5:0] x; 
	reg [5:0] y; 
	 
	wire [5:0] r; 
	
// ------------------------- instancia
	comparadorI modulo(r, x, y);

// ------------------------- parte principal 
	initial begin 
		$display("Exemplo0021 - Camila Guedes Silveira - 427393"); 
		$display("Teste Comparador de Igualdade"); 
		
		x = 6'b000000;
		y = 6'b000000;
		
		#1 $display("%b  %b = %b", x, y, r);
		
		x = 6'b000001;
		y = 6'b000000;
		
		#1 $display("%b  %b = %b", x, y, r);
	
	end 
endmodule // test_comparadorI