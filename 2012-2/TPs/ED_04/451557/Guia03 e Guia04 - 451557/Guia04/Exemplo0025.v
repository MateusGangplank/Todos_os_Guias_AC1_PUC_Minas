// ------------------------- 
// Exemplo0025 - COMPLEMENTO DE 2
// Nome: Gabriel Carlos Damasceno Arriel -
// Matricula: 451557
// ------------------------- 

// -------------------------
//  complemento
// -------------------------

module halfAdder1 (output s1, output s, input a);
	xor (s, a, 1);
	and (s1, a, 1);
endmodule // halfAdder1

module halfAdder2 (output s1, output s, input a, input b);
	xor (s, a, b);
	and (s1, a, b);
endmodule // halfAdder2

module Complemento (output c, output s2, output s1, output s, input [2:0] a);
	wire not1,not2,not3,x,y;
	
	not NOT1 (not1, a[0]);
	not NOT2 (not2, a[1]);
	not NOT3 (not3, a[2]);
	halfAdder1 HA1  (x, s, not1);
	halfAdder2 HA2A (y, s1, not2, x);
	halfAdder2 HA2B (c, s2, not3, y);
endmodule // Complemento

module test_Complemento;
// ------------------------- definir dados
   reg [2:0]x;
	wire c,s2,s1,s;
	
	Complemento Cde2 (c,s2,s1,s,x);
	
	initial begin: start
		x = 3'b000; 
	end
	
// ------------------------- parte principal
   initial begin
      $display("Exemplo0025 - Gabriel Carlos Damasceno Arriel - 451557");
      $display("Test ALU's complemento de 2");
      $monitor("%b(a) = %b(c) %b(s2) %b(s1) %b(s)",x,c,s2,s1,s); 
		#1 x = 3'b001;  
		#1 x = 3'b010; 
		#1 x = 3'b011; 
		#1 x = 3'b100; 
		#1 x = 3'b101; 
		#1 x = 3'b110; 
		#1 x = 3'b111; 
   end
endmodule // test_Complemento
