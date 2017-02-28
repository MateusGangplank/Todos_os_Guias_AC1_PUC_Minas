// -------------------------
// Exemplo0031 - SOMADOR ALGEBRICO
// Nome: Camila Guedes Silveira 
// Matricula: 427393 
// ------------------------- 

// ------------------------- 
// SomadorA
// ------------------------- 

module somadorA (output [5:0]s, input [5:0]a, input [5:0]b, input carryIn, output carryOut); 
	// descrever por portas 

// OBS.: EXPERIMENTAR DEFINICAO POR PORTAS
	
	assign s[0] = (a[0] ^ (b[0] ^ carryIn)) ^ carryIn;
	assign c1 = ((b[0] ^ carryIn) & carryIn) | (a[0] &((b[0] ^ carryIn) ^ carryIn));
	
	assign s[1] = (a[1] ^ (b[1] ^ carryIn)) ^ c1;
	assign c2 = ((b[1] ^ carryIn) & c1) | (a[1] &((b[1] ^ carryIn) ^ c1));
	
	assign s[2] = (a[2] ^ (b[2] ^ carryIn)) ^ c2;
	assign c3 = ((b[2] ^ carryIn) & c2) | (a[2] &((b[2] ^ carryIn) ^ c2));
	
	assign s[3] = (a[3] ^ (b[3] ^ carryIn)) ^ c3;
	assign c4 = ((b[3] ^ carryIn) & c3) | (a[3] &((b[3] ^ carryIn) ^ c3));
	
	assign s[4] = (a[4] ^ (b[4] ^ carryIn)) ^ c4;
	assign c5 = ((b[4] ^ carryIn) & c4) | (a[4] &((b[4] ^ carryIn) ^ c4));
	
	assign s[5] = (a[5] ^ (b[5] ^ carryIn)) ^ c5;
	assign c6 = ((b[5] ^ carryIn) & c5) | (a[5] &((b[5] ^ carryIn) ^ c5));
	
	
	
endmodule // somadorA 

module test_somadorA; 
// ------------------------- definir dados 
	reg [5:0] x; 
	reg [5:0] y; 
	reg carryIn;
	wire carryOut;
	wire [5:0] r; 
	
// ------------------------- instancia
	somadorA modulo(r, x, y, carryIn, carryOut);

// ------------------------- parte principal 
	initial begin 
		$display("Exemplo0021 - Camila Guedes Silveira - 427393"); 
		$display("Teste Somador Algébrico"); 
		
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
endmodule // test_somadorA