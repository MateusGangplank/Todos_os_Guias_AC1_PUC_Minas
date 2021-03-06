// -------------------------
// Exemplo0025 - cal complemento de 2
// Nome: Lorena Danielle Gon�alves Bento 
// Matricula: 435049 
// -------------------------
// ------------------------- 
// cal complemento de 2
// ------------------------- 

module compl (output [5:0]s, input [5:0]a, input carry); 
	//-- descrever por portas 
	                              // EXPERIMENTAR A DEFINICAO POR PORTAS !!!
	assign carry = 1;
	assign s = ~(a) ^ carry;
	
endmodule // compl 

module test_compl; 
// ------------------------- definir dados 
	reg [5:0] x; 	 
	reg carry;
	wire [5:0] r; 
	
// ------------------------- instancia
	compl modulo(r, x, carry);

// ------------------------- parte principal 
	initial begin 
		$display("Exemplo0025 - Lorena Danielle Gon�alves Bento  - 435049"); 
		$display("Teste Complemento de 2"); 
		
		x = 6'b000001;
		carry = 1;				
		#1 $display("%b = %b", x, r);
		
		x = 6'b000010;	
		carry = 1;	
		#1 $display("%b = %b", x, r);
		
		x = 6'b010101;		
		carry = 1;
		#1 $display("%b = %b", x, r);
		
	end 
endmodule // test_compl