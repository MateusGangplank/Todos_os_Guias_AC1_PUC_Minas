// ------------------------- 
// Exemplo0024 - COMPARADOR DIFERENÇA 
// Nome: Luis Vasconcelos Dias 
// Matricula: 412753 
// ------------------------- 

// ------------------------- 
// Comparador de Diferença
// ------------------------- 

module comparadorD (output [5:0]s, input [5:0]a, input [5:0]b); 
	// descrever por portas 
	
	assign s = (a ^ b);
	
endmodule // comparadorD 

module test_comparadorD; 
// ------------------------- definir dados 
	reg [5:0] x; 
	reg [5:0] y; 
	 
	wire [5:0] r; 
	
// ------------------------- instancia
	comparadorD modulo(r, x, y);

// ------------------------- parte principal 
	initial begin 
		$display("Exemplo0021 - Luis Vasconcelos Dias - 412753"); 
		$display("Teste Comparador de Diferença"); 
		
		x = 6'b000000;
		y = 6'b000000;
		
		#1 $display("%b  %b = %b", x, y, r);
		
		x = 6'b000001;
		y = 6'b000000;
		
		#1 $display("%b  %b = %b", x, y, r);
	
	end 
endmodule // test_comparadorD