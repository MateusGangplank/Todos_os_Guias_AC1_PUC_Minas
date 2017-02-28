// ------------------------- 
// Exemplo0024 - COMPARADOR SELECIONAVEL
// Nome: Oswaldo Oliveira Paulino
// Matricula: 382175
// ------------------------- 

// -------------------------
//  comparador
// -------------------------

module comparadorIgu (output s, input  [2:0]a, input  [2:0]b);
	wire [2:0]xn;
	
	xnor XNOR1 (xn[0], a[0], b[0]);
	xnor XNOR2 (xn[1], a[1], b[1]);
	xnor XNOR3 (xn[2], a[2], b[2]);
	and  (s, xn[0], xn[1], xn[2]);
endmodule // comparadorIgu

module comparadorDif (output s, input  [2:0]a, input  [2:0]b);
	wire [2:0]x;
	
	xor XOR1 (x[0], a[0], b[0]);
	xor XOR2 (x[1], a[1], b[1]);
	xor XOR3 (x[2], a[2], b[2]);
	or  OR1  (s, x[0], x[1], x[2]);
endmodule // comparadorDif

module comparadorSel (output sI, output sD, input  [2:0]a, input  [2:0]b, input ch);
	wire notCH,x,y;
	
	not NOT1            (notCH, ch);
	comparadorIgu igual (x, a, b);
	comparadorDif dif   (y, a, b);
	and AND1            (sI, x, notCH);
	and AND2            (sD, y, ch);
endmodule // comparadorSel

module test_comparadorSel;
// ------------------------- definir dados
   reg [2:0]x;
	reg [2:0]y;
	reg ch;
	wire w;
	wire z;
	
	comparadorSel selecionavel (w, z, x, y, ch);
	
	initial begin: start
		x = 3'b000; 
		y = 3'b000;
		ch= 0;
	end
	
// ------------------------- parte principal
   initial begin
      $display("Exemplo0027 - Oswaldo Oliveira Paulino - 382175");
      $display("Test ALU's comparador");
		$display("------------ CHAVE = 0 ------------");
		$display(" a   b  = s");
      $monitor("%b %b = %b",x,y,w); 
		#1 x = 3'b001; y = 3'b001; ch = 0; 
		#1 x = 3'b101; y = 3'b011; ch = 0; 
		#1 x = 3'b011; y = 3'b100; ch = 0;  
		#1 x = 3'b111; y = 3'b101; ch = 0;  
		#1 x = 3'b011; y = 3'b011; ch = 0;  
		#1 x = 3'b101; y = 3'b101; ch = 0; 
		#1 x = 3'b001; y = 3'b010; ch = 0; 
	   #1 x = 3'b010; y = 3'b010; ch = 0; 
		
	   $display("------------ CHAVE = 1 ------------");
	   $display(" a   b  = s");
      $monitor("%b %b = %b",x,y,z); 
		#1 x = 3'b001; y = 3'b001; ch = 1; 
		#1 x = 3'b101; y = 3'b011; ch = 1; 
		#1 x = 3'b011; y = 3'b100; ch = 1;  
		#1 x = 3'b111; y = 3'b101; ch = 1;  
		#1 x = 3'b011; y = 3'b011; ch = 1;  
		#1 x = 3'b101; y = 3'b101; ch = 1; 
		#1 x = 3'b001; y = 3'b010; ch = 1; 
	   #1 x = 3'b010; y = 3'b010; ch = 1; 	
   end
endmodule // test_comparadorSel
/*
    Exemplo0027 - Oswaldo Oliveira Paulino - 382175
    Test ALU's comparador
    ------------ CHAVE = 0 ------------
     a   b  = s
    000 000 = 1
    001 001 = 1
    101 011 = 0
    011 100 = 0
    111 101 = 0
    011 011 = 1
    101 101 = 1
    001 010 = 0
    ------------ CHAVE = 1 ------------
     a   b  = s
    010 010 = 0
    001 001 = 0
    101 011 = 1
    011 100 = 1
    111 101 = 1
    011 011 = 0
    101 101 = 0
    001 010 = 1
    010 010 = 0
*/