// ------------------------- 
// Exemplo0025 - COMPLEMENTO DE 2
// Nome: Camila Guedes Silveira 
// Matricula: 427393 
// ------------------------- 

// ------------------------- 
// Complemento de 2
// ------------------------- 

module complemento2 (output [5:0]s, input [5:0]a, input carryIn); 
	// descrever por portas 
	
	assign carryIn = 1;
	assign s = ~(a) ^ carryIn;
	
endmodule // complemento2 

module test_complemento2; 
// ------------------------- definir dados 
	reg [5:0] x; 
	 
	reg carry;
	wire [5:0] r; 
	
// ------------------------- instancia
	complemento2 modulo(r, x, carry);

// ------------------------- parte principal 
	initial begin 
		$display("Exemplo0021 - Camila Guedes Silveira - 427393"); 
		$display("\nTeste Complemento de 2"); 
		
		x = 6'b000001;
		carry = 1;				
		#1 $display("\n%b = %b", x, r);
		
		x = 6'b000010;		
		#1 $display("%b = %b", x, r);
		
		x = 6'b010101;		
		#1 $display("%b = %b", x, r);
		
	end 
endmodule // test_complemento2