// ------------------------- 
// Exemplo0024 - COMPARADOR
// Nome: Oswaldo Oliveira Paulino
// Matricula: 382175
// ------------------------- 

// -------------------------
//  comparador
// -------------------------
module Comparador (output s, input  [2:0]a, input  [2:0]b);
	wire [2:0]x;
	
	xor XOR1 (x[0], a[0], b[0]);
	xor XOR2 (x[1], a[1], b[1]);
	xor XOR3 (x[2], a[2], b[2]);
	or  OR1  (s, x[0], x[1], x[2]);
endmodule // Comparador

module test_Comparador;
// ------------------------- definir dados
   reg [2:0]x;
	reg [2:0]y;
	wire s;
	
	Comparador diferenca (s, x, y);
	
	initial begin: start
		x = 3'b000; 
		y = 3'b001;
	end
	
// ------------------------- parte principal
   initial begin
      $display("Exemplo0024 - Oswaldo Oliveira Paulino - 382175");
      $display("Test ALU's comparador");
		$display(" a   b  = s");
      $monitor("%b %b = %b",x,y,s); 
		#1 x = 3'b001; y = 3'b010; 
		#1 x = 3'b001; y = 3'b001; 
		#1 x = 3'b101; y = 3'b110; 
		#1 x = 3'b011; y = 3'b011;
		#1 x = 3'b100; y = 3'b100; 
		#1 x = 3'b111; y = 3'b000; 
		#1 x = 3'b111; y = 3'b111; 
   end
endmodule // test_Comparador
/*
    Exemplo0024 - Oswaldo Oliveira Paulino - 382175
    Test ALU's comparador
     a   b  = s
    000 001 = 1
    001 010 = 1
    001 001 = 0
    101 110 = 1
    011 011 = 0
    100 100 = 0
    111 000 = 1
    111 111 = 0
*/