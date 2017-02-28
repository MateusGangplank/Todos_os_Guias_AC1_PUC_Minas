// ------------------------- 
// Exemplo0021 - FULL ADDER 	
// Nome: Lorena Danielle Gonçalves Bento 
// Matricula: 435049 
// ------------------------- 

// ------------------------- 
// FULL ADDER 
// ------------------------- 

module fulladder (output [5:0]s, input [5:0]a, input [5:0]b, input incarry, output outcarry); 
	
	
	//-- descrever por portas --
	
	assign s[0] = (a[0] ^ b[0]) ^ incarry;
	assign h1 = ((a[0] & b[0]) | ((a[0] ^ b[0]) & incarry));
	assign s[1] = (a[1] ^ b[1]) ^ h1;
	
	assign h2 = ((a[1] & b[1]) | ((a[1] ^ b[1]) & h1));
	assign s[2] = (a[2] ^ b[2]) ^ h2;
	
	assign h3 = ((a[2] & b[2]) | ((a[2] ^ b[2]) & h2));
	assign s[3] = (a[3] ^ b[3]) ^ h3;
	
	assign h4 = ((a[3] & b[3]) | ((a[3] ^ b[3]) & h3));
	assign s[4] = (a[4] ^ b[4]) ^ h4;
	
	assign h5 = ((a[4] & b[4]) | ((a[4] ^ b[4]) & h4));
	assign s[5] = (a[5] ^ b[5]) ^ h5;
	
	assign h6 = ((a[5] & b[5]) | ((a[5] ^ b[5]) & h5));
	

	
endmodule // fulladder 

module test_fulladder; 
// ------------------------- definir dados 
	reg [5:0] x; 
	reg [5:0] y; 
	reg incarry;
	wire outcarry;
	wire [5:0] soma; 
	
// ------------------------- instancia
	fulladder modulo(soma, x, y, incarry, outcarry);

// ------------------------- parte principal 
	initial begin 
		$display("Exemplo0021 - Lorena Danielle Gonçalves Bento - 435049"); 
		$display("Teste Somador"); 
		
		x = 6'b000001;
		y = 6'b000001;
		incarry = 0;
		
		#1 $display("%b + %b = %b", x, y, soma);
		
		x = 6'b000011;
		y = 6'b000011;
		incarry = 1;
		
		#1 $display("%b + %b = %b", x, y, soma);
		
		x = 6'b010101;
		y = 6'b101010;
		incarry = 0;
		
		#1 $display("%b + %b = %b", x, y, soma);
		
		x = 6'b011111;
		y = 6'b011111;
		incarry = 1;
		
		#1 $display("%b + %b = %b", x, y, soma);
		
	
	end 
endmodule // test_fulladder