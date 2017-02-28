// ------------------------- 
// Exemplo0024 - 4bit Comparador de Diferença
// Nome: Bruno Cezar Andrade Viallet 
// Matricula: 396679
// ------------------------- 

// ------------------------- 
// Comparador de Diferença
// ------------------------- 

module compD (output [3:0]s, input [3:0]a, input [3:0]b); 
	// descrever por portas 
	
	assign s = (a ^ b);
	
endmodule // compD

module test_compD; 
// ------------------------- definir dados 
	reg [3:0] x; 
	reg [3:0] y; 
	 
	wire [3:0] r; 
	
// ------------------------- instancia
	compD modulo(r, x, y);

// ------------------------- parte principal 
	initial begin 
		$display("Exemplo0024 - Bruno Cezar Andrade Viallet - 396679"); 
		$display("Teste Comparador de Diferença"); 
		
		x = 4'b0000;
		y = 4'b0000;
		
		#1 $display("%b  %b = %b", x, y, r);
		
		x = 4'b0001;
		y = 4'b0000;
		
		#1 $display("%b  %b = %b", x, y, r);
	
	end 
endmodule // test_compD