// -------------------------
// Exemplo0027 - Extra 02
// Nome: Bruno Cezar Andrade Viallet 
// Matricula: 396679
// ------------------------- 

// ------------------------- 
// Comparador de Diferenša
// ------------------------- 

module compD (output [3:0]s, input [3:0]a, input [3:0]b); 
	// descrever por portas 
	
	assign s = (a ^ b);
	
endmodule // compD


// ------------------------- 
// Comparador de Igualdade
// ------------------------- 

module compI (output [3:0]s, input [3:0]a, input [3:0]b); 
	// descrever por portas 
	
	assign s = ~(a ^ b);
	
endmodule // compI 


// ------------------------- 
// Seletor
// ------------------------- 

module seletor (output [3:0]s, input [3:0]a, input [3:0]b, input [3:0] chave); 
	wire [3:0] s1;
	wire [3:0] s2;
	wire [3:0] a1;
	wire [3:0] a2;
	
	// descrever por portas 
	
	compI comparador1(s1, a, b);
	compD comparador2(s2, a, b);
	
	assign a1 = (s1 & ~chave);
	assign a2 = (s2 & chave);
	assign s = (a1 | a2);
	
	
endmodule // seletor

module test_seletor; 
// ------------------------- definir dados 
	reg [3:0] x; 
	reg [3:0] y;
	reg [3:0] chave;
	 
	wire [3:0] r; 
	
// ------------------------- instancia
	seletor modulo(r, x, y, chave);

// ------------------------- parte principal 
	initial begin 
		$display("Exemplo0027 - Bruno Cezar Andrade Viallet - 396679"); 
		$display("Teste Comparador de Diferenša ou Igualdade"); 
		
		x = 4'b0000;
		y = 4'b0000;
		chave = 4'b0000;
		#1 $display("%b  %b = %b // Chave = %b", x, y, r, chave);
		chave = 4'b1111;
		#1 $display("%b  %b = %b // Chave = %b", x, y, r, chave);
		
	
		
		x = 4'b0001;
		y = 4'b0000;
		
		chave = 4'b0000;
		#1 $display("%b  %b = %b // Chave = %b", x, y, r, chave);
		chave = 4'b1111;
		#1 $display("%b  %b = %b // Chave = %b", x, y, r, chave);
		
		x = 4'b0101;
		y = 4'b1011;
		
		chave = 4'b0000;
		#1 $display("%b  %b = %b // Chave = %b", x, y, r, chave);
		chave = 4'b1111;
		#1 $display("%b  %b = %b // Chave = %b", x, y, r, chave);
	
	end 
endmodule // test_seletor

// OBS.: EXPERIMENTAR AS DEFINICOES POR PORTAS !
