// ------------------------- 
// Exemplo0032 - RESULTADO DA OPERAÇÃO
// Nome: Camila Guedes Silveira 
// Matricula: 427393 
// ------------------------- 

// ------------------------- 
// resultado
// ------------------------- 

module resultado (output [5:0]s, input [5:0]a, input [5:0]b, input carryIn, output carryOut, output t); 
	// descrever por portas 
	
	wire zero = 0;
	
	assign s[0] = ~(((a[0] ^ (b[0] ^ carryIn)) ^ carryIn) | zero);
	assign c1 = ((b[0] ^ carryIn) & carryIn) | (a[0] &((b[0] ^ carryIn) ^ carryIn));
	
	assign s[1] = ~(((a[1] ^ (b[1] ^ carryIn)) ^ c1) | zero);
	assign c2 = ((b[1] ^ carryIn) & c1) | (a[1] &((b[1] ^ carryIn) ^ c1));
	
	assign s[2] = ~(((a[2] ^ (b[2] ^ carryIn)) ^ c2) | zero);
	assign c3 = ((b[2] ^ carryIn) & c2) | (a[2] &((b[2] ^ carryIn) ^ c2));
	
	assign s[3] = ~(((a[3] ^ (b[3] ^ carryIn)) ^ c3) | zero);
	assign c4 = ((b[3] ^ carryIn) & c3) | (a[3] &((b[3] ^ carryIn) ^ c3));
	
	assign s[4] = ~(((a[4] ^ (b[4] ^ carryIn)) ^ c4) | zero);
	assign c5 = ((b[4] ^ carryIn) & c4) | (a[4] &((b[4] ^ carryIn) ^ c4));
	
	assign s[5] = ~(((a[5] ^ (b[5] ^ carryIn)) ^ c5) | zero);
	assign c6 = ((b[5] ^ carryIn) & c5) | (a[5] &((b[5] ^ carryIn) ^ c5));
	
	assign t = (s[1] & s[2] & s[3] & s[4] & s[5]);
	
	
endmodule // resultado 

module test_resultado; 
// ------------------------- definir dados 
	reg [5:0] x; 
	reg [5:0] y; 
	reg carryIn;
	wire carryOut;
	wire [5:0]s; 
	wire r;
	
// ------------------------- instancia
	resultado modulo(s, x, y, carryIn, carryOut, r);

// ------------------------- parte principal 
	initial begin 
		$display("Exemplo0032 - Camila Guedes Silveira - 427393"); 
		$display("Teste Resultado do Somador Algébrico"); 
		
		x = 6'b000001;
		y = 6'b000001;
		carryIn = 1;
		
		#1 $display("%b - %b = %b", x, y, r);
		
		x = 6'b100000;
		y = 6'b000001;
		carryIn = 0;
		
		#1 $display("%b + %b = %b", x, y, r);
		
		x = 6'b000111;
		y = 6'b000001;
		carryIn = 1;
		
		#1 $display("%b - %b = %b", x, y, r);
		
		x = 6'b000001;
		y = 6'b000010;
		carryIn = 0;
		
		#1 $display("%b + %b = %b", x, y, r);
	
	end 
endmodule // test_resultado