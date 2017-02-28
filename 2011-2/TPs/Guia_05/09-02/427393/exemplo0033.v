// ------------------------- 
// Exemplo0033 - INCREMENTO DE 1
// Nome: Camila Guedes Silveira 
// Matricula: 427393 
// ------------------------- 

// ------------------------- 
// incremento
// ------------------------- 

module incremento (output [5:0]s, input [5:0]a); 
	// descrever por portas 
	
	wire [5:0] b = 0;
	assign carryIn = 1;
	
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
	
endmodule // incremento 

module test_incremento; 
// ------------------------- definir dados 
	reg [5:0] x; 
	wire [5:0]s; 
	
	
// ------------------------- instancia
	incremento modulo(s, x);

// ------------------------- parte principal 
	initial begin 
		$display("Exemplo0032 - Camila Guedes Silveira - 427393"); 
		$display("Teste Incremento de 1"); 
		
		x = 6'b000001;
		
		
		#1 $display("%b = %b", x, s);
		
		x = 6'b100000;
			
		
		#1 $display("%b = %b", x, s);
		
		x = 6'b000111;
						
		#1 $display("%b = %b", x, s);
		
		x = 6'b000001;
						
		#1 $display("%b = %b", x, s);
	
	end 
endmodule // test_incremento