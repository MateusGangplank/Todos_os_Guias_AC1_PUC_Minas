// ------------------------- 
// Exemplo0023 - COMPARADOR
// Nome: Oswaldo Oliveira Paulino
// Matricula: 382175
// ------------------------- 

// -------------------------
//  comparador
// -------------------------
module Comparador (output s, input  [2:0]a, input  [2:0]b);
	wire [2:0]xn;
	
	xnor XNOR1 (xn[0], a[0], b[0]);
	xnor XNOR2 (xn[1], a[1], b[1]);
	xnor XNOR3 (xn[2], a[2], b[2]);
	and  (s, xn[0], xn[1], xn[2]);
endmodule // Comparador

module test_Comparador;
// ------------------------- definir dados
   reg [2:0]x;
	reg [2:0]y;
	wire s;
	
	Comparador igualdade (s, x, y);
	
	initial begin: start
		x = 3'b000; 
		y = 3'b001;
	end
	
// ------------------------- parte principal
   initial begin
      $display("Exemplo0023 - Oswaldo Oliveira Paulino - 382175");
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
    Exemplo0023 - Oswaldo Oliveira Paulino - 382175
    Test ALU's comparador
     a   b  = s
    000 001 = 0
    001 010 = 0
    001 001 = 1
    101 110 = 0
    011 011 = 1
    100 100 = 1
    111 000 = 0
    111 111 = 1
*/