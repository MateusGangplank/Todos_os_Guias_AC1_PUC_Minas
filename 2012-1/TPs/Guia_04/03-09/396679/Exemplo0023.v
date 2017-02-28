// ------------------------- 
// Exemplo0023 - 4bit Comparador de Igualdade
// Nome: Bruno Cezar Andrade Viallet 
// Matricula: 396679
// ------------------------- 

// ------------------------- 
// Comparador de Igualdade
// ------------------------- 

module compI (output [3:0]s, input [3:0]a, input [3:0]b); 
	// descrever por portas 
	
	assign s = ~(a ^ b);
	
endmodule // compI 

module test_compI; 
// ------------------------- definir dados 
	reg [3:0] x; 
	reg [3:0] y; 
	 
	wire [3:0] r; 
	
// ------------------------- instancia
	compI modulo(r, x, y);

// ------------------------- parte principal 
	initial begin 
		$display("Exemplo0023 - Bruno Cezar Andrade Viallet - 396679"); 
		$display("Teste Comparador de Igualdade"); 
		
		x = 4'b0000;
		y = 6'b0000;
		
		#1 $display("%b  %b = %b", x, y, r);
		
		x = 4'b0001;
		y = 4'b0000;
		
		#1 $display("%b  %b = %b", x, y, r);
	
	end 
endmodule // test_compI