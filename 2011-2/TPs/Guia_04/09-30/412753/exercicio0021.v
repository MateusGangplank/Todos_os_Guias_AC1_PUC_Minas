// -------------------------
// Exemplo0023 - SOMADOR 6 BITS	
// Nome: Luis Vasconcelos Dias 
// Matricula: 412753 
// ------------------------- 

// ------------------------- 
// Somador
// ------------------------- 

module somador (output [5:0]s, input [5:0]a, input [5:0]b, input carryIn, output carryOut); 
	// descrever por portas 

// EXPERIMENTAR DEFINICAO POR PORTAS

	assign s[0] = (a[0] ^ b[0]) ^ carryIn;
	assign c1 = ((a[0] & b[0]) | ((a[0] ^ b[0]) & carryIn));
	assign s[1] = (a[1] ^ b[1]) ^ c1;
	assign c2 = ((a[1] & b[1]) | ((a[1] ^ b[1]) & c1));
	assign s[2] = (a[2] ^ b[2]) ^ c2;
	assign c3 = ((a[2] & b[2]) | ((a[2] ^ b[2]) & c2));
	assign s[3] = (a[3] ^ b[3]) ^ c3;
	assign c4 = ((a[3] & b[3]) | ((a[3] ^ b[3]) & c3));
	assign s[4] = (a[4] ^ b[4]) ^ c4;
	assign c5 = ((a[4] & b[4]) | ((a[4] ^ b[4]) & c4));
	assign s[5] = (a[5] ^ b[5]) ^ c5;
	assign c6 = ((a[5] & b[5]) | ((a[5] ^ b[5]) & c5));
	
	
	
endmodule // somador 

module test_somador; 
// ------------------------- definir dados 
	reg [5:0] x; 
	reg [5:0] y; 
	reg carryIn;
	wire carryOut;
	wire [5:0] r; 
	
// ------------------------- instancia
	somador modulo(r, x, y, carryIn, carryOut);

// ------------------------- parte principal 
	initial begin 
		$display("Exemplo0021 - Luis Vasconcelos Dias - 412753"); 
		$display("Teste Somador"); 
		
		x = 6'b000001;
		y = 6'b000000;
		carryIn = 0;
		
		#1 $display("%b  %b = %b", x, y, r);
		
		x = 6'b000001;
		y = 6'b000011;
		carryIn = 0;
		
		#1 $display("%b  %b = %b", x, y, r);
	
	end 
endmodule // test_somador