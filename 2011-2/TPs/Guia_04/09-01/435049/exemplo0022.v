// -------------------------
// Exemplo0022 - HALF ADDER 	
// Nome: Lorena Danielle Gonçalves Bento 
// Matricula: 435049 
// ------------------------- 
// ------------------------- 
// HALF ADDER
// ------------------------- 

module half (output [5:0]s, input [5:0]a, input [5:0]b, input incarry, output outcarry); 
	
	//-- descrever por portas
                                       // EXPERIMENTAR A DEFINICAO POR PORTAS !!!
 assign h1 = ~(a[0] ^ b[0]) & incarry | (~(a[0]) & b[0]);
 assign s[0] = incarry ^ (a[0] ^ b[0]);	
 
 assign h2 = ~(a[1] ^ b[1]) & h1 | (~(a[1]) & b[1]);
 assign s[1] = h1 ^ (a[1] ^ b[1]);	
 
 assign h3 = ~(a[2] ^ b[2]) & h2 | (~(a[2]) & b[2]);
 assign s[2] = h2 ^ (a[2] ^ b[2]);	
 
 assign h4 = ~(a[3] ^ b[3]) & h3 | (~(a[3]) & b[3]);
 assign s[3] = h3 ^ (a[3] ^ b[3]);	
 
 assign h5 = ~(a[4] ^ b[4]) & h4 | (~(a[4]) & b[4]);
 assign s[4] = h4 ^ (a[4] ^ b[4]);
 
 assign h6 = ~(a[5] ^ b[5]) & h5 | (~(a[5]) & b[5]);
 assign s[5] = h5 ^ (a[5] ^ b[5]);
 
 assign outcarry = ~(a[6] ^ b[6]) & h6 | (~(a[6]) & b[6]);
 
 
endmodule // half 

module test_half; 
// ------------------------- definir dados 
	reg [5:0] x; 
	reg [5:0] y; 
	reg incarry;
	wire outcarry;
	wire [5:0] half; 
	
// ------------------------- instancia
	half modulo(half, x, y, incarry, outcarry);

// ------------------------- parte principal 
	initial begin 
		$display("Exemplo0022 - Lorena Danielle Gonçalves Bento - 435049"); 
		$display("Teste Half Adder"); 
		
		x = 6'b000001;
		y = 6'b000001;
		incarry = 0;
		
		#1 $display("%b - %b = %b", x, y, half);
		
		x = 6'b000011;
		y = 6'b000011;
		incarry = 0;
		
		#1 $display("%b - %b = %b", x, y, half);
		
		x = 6'b010101;
		y = 6'b101010;
		incarry = 0;
		
		#1 $display("%b - %b = %b", x, y, half);
		
		x = 6'b011111;
		y = 6'b011111;
		incarry = 0;
		
		#1 $display("%b - %b = %b", x, y, half);
		
		//--incarry = 1
		x = 6'b000001;
		y = 6'b000001;
		incarry = 1;
		
		#1 $display("%b - %b = %b", x, y, half);
		
		x = 6'b000011;
		y = 6'b000011;
		incarry = 1;
		
		#1 $display("%b - %b = %b", x, y, half);
		
		x = 6'b010101;
		y = 6'b101010;
		incarry = 1;
		
		#1 $display("%b - %b = %b", x, y, half);
		
		x = 6'b011111;
		y = 6'b011111;
		incarry = 1;
		
		#1 $display("%b - %b = %b", x, y, half);
		
		
		
		
	
	end 
endmodule // test_sub