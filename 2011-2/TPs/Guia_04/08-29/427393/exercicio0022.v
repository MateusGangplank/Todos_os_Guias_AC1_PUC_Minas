// ------------------------- 
// Exemplo0023 - SUBTRATOR 6 BITS	
// Nome: Camila Guedes Silveira 
// Matricula: 427393 
// ------------------------- 

// ------------------------- 
// Sub
// ------------------------- 

module sub (output [5:0]s, input [5:0]a, input [5:0]b, input carryIn, output carryOut); 
	// descrever por portas 
	
 assign c1 = ~(a[0] ^ b[0]) & carryIn | (~(a[0]) & b[0]);
 assign s[0] = carryIn ^ (a[0] ^ b[0]);	
 assign c2 = ~(a[1] ^ b[1]) & c1 | (~(a[1]) & b[1]);
 assign s[1] = c1 ^ (a[1] ^ b[1]);	
 assign c3 = ~(a[2] ^ b[2]) & c2 | (~(a[2]) & b[2]);
 assign s[2] = c2 ^ (a[2] ^ b[2]);	
 assign c4 = ~(a[3] ^ b[3]) & c3 | (~(a[3]) & b[3]);
 assign s[3] = c3 ^ (a[3] ^ b[3]);	
 assign c5 = ~(a[4] ^ b[4]) & c4 | (~(a[4]) & b[4]);
 assign s[4] = c4 ^ (a[4] ^ b[4]);
 assign c6 = ~(a[5] ^ b[5]) & c5 | (~(a[5]) & b[5]);
 assign s[5] = c5 ^ (a[5] ^ b[5]);
 assign carryOut = ~(a[6] ^ b[6]) & c6 | (~(a[6]) & b[6]);
 
 
endmodule // sub 

module test_sub; 
// ------------------------- definir dados 
	reg [5:0] x; 
	reg [5:0] y; 
	reg carryIn;
	wire carryOut;
	wire [5:0] r; 
	
// ------------------------- instancia
	sub modulo(r, x, y, carryIn, carryOut);

// ------------------------- parte principal 
	initial begin 
		$display("Exemplo0021 - Camila Guedes Silveira - 427393"); 
		$display("Teste Subtrator"); 
		
		x = 6'b000001;
		y = 6'b000000;
		carryIn = 0;
		
		#1 $display("%b  %b = %b", x, y, r);
		
		x = 6'b000001;
		y = 6'b000011;
		carryIn = 0;
		
		#1 $display("%b  %b = %b", x, y, r);
	
	end 
endmodule // test_sub