// -------------------------
// Exemplo0023 - comparador para igualdade  
// Nome: Lorena Danielle Gonçalves Bento 
// Matricula: 435049 
// ------------------------- 
// ------------------------- 
// comparador para igualdade
// ------------------------- 

module comp (output [5:0]s, input [5:0]a, input [5:0]b); 
	//-- descrever por portas --
	
assign s = ~(a ^ b);     // EXPERIMENTAR A DEFINICAO POR PORTAS !!!

	
endmodule // comp 

module test_comp; 
// ------------------------- definir dados 
	reg [5:0] x; 
	reg [5:0] y; 	 
	wire [5:0] r; 
	
	comp modulo(r, x, y);

// ------------------------- parte principal 
	initial begin 
		$display("Exemplo0023 - Lorena Danielle Gonçalves Bento - 435049"); 
		$display("Teste comparador para igualdade"); 
		
		x = 6'b000000;
		y = 6'b000000;
		
		#1 $display("%b == %b = %b", x, y, r);
		
		
		x = 6'b100100;
		y = 6'b100001;
		
		#1 $display("%b == %b = %b", x, y, r);
		
		x = 6'b111111;
		y = 6'b111111;
		
		#1 $display("%b == %b = %b", x, y, r);
	
	end 
endmodule // test_comp