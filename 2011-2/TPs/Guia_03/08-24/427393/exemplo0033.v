// ------------------------- 
// Exemplo0033 - F4 
// Nome: Camila Guedes Silveira
// Matricula: 427393
// ------------------------- 

// ------------------------- 
// f4_gate 
// ------------------------- 

module f4 (output [7:0] s, input [3:0] a, input [3:0] b, input[3:0]c); 
	
	// --descrever por portas 
	assign s[3:0] = ((a | b) & c) | ((~(a | b)) & ~c);
	assign s[7:4] = ((a & b) & c) | ((~(a & b)) & ~c);
	
endmodule // f4 

module test_f4; 
	// ------------------------- definir dados 
	reg [3:0] x; 
	reg [3:0] y; 
	reg [3:0] z;
	wire [7:0] r; 
	
	f4 modulo (r, z, x, y); 
	
	// ------------------------- parte principal 
		initial begin 
		
		$display("Exemplo0033 - Camila Guedes Silveira - 427393"); 
		$display("Test LU's module"); 
		
		x = 4'b0011; y = 4'b0101; z = 0;
		
		// --projetar testes do modulo 
		#1 $display("\n%3b  %3b = %7b",x,y,r); 
		
	end
endmodule // test_f4 