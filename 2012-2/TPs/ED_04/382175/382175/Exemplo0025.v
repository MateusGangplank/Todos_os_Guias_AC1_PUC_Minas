// ------------------------- 
// Exemplo0025 - COMPLEMENTO DE 2
// Nome: Oswaldo Oliveira Paulino
// Matricula: 382175
// ------------------------- 

// -------------------------
//  complemento
// -------------------------

module halfAdder1 (output s1, output s0, input a);
	xor (s0, a, 1);
	and (s1, a, 1);
endmodule // halfAdder1

module halfAdder2 (output s1, output s0, input a, input b);
	xor (s0, a, b);
	and (s1, a, b);
endmodule // halfAdder2

module Complemento (output c_out, output s2, output s1, output s0, input [2:0] a);
	wire notA0,notA1,notA2,x,y;
	
	not NOT1 (notA0, a[0]);
	not NOT2 (notA1, a[1]);
	not NOT3 (notA2, a[2]);
	halfAdder1 HA1  (x, s0, notA0);
	halfAdder2 HA2A (y, s1, notA1, x);
	halfAdder2 HA2B (c_out, s2, notA2, y);
endmodule // Complemento

module test_Complemento;
// ------------------------- definir dados
   reg [2:0]x;
	wire c_out,s2,s1,s0;
	
	Complemento Cde2 (c_out,s2,s1,s0,x);
	
	initial begin: start
		x = 3'b000; 
	end
	
// ------------------------- parte principal
   initial begin
      $display("Exemplo0025 - Oswaldo Oliveira Paulino - 382175");
      $display("Test ALU's complemento");
		$display(" a  = c_out s2 s1 s0");
      $monitor("%b =   %b    %b  %b  %b",x,c_out,s2,s1,s0); 
		#1 x = 3'b001;  
		#1 x = 3'b010; 
		#1 x = 3'b011; 
		#1 x = 3'b100; 
		#1 x = 3'b101; 
		#1 x = 3'b110; 
		#1 x = 3'b111; 
   end
endmodule // test_Complemento
/*
    Exemplo0025 - Oswaldo Oliveira Paulino - 382175
    Test ALU's complemento
     a  = c_out s2 s1 s0
    000 =   1    0  0  0
    001 =   0    1  1  1
    010 =   0    1  1  0
    011 =   0    1  0  1
    100 =   0    1  0  0
    101 =   0    0  1  1
    110 =   0    0  1  0
    111 =   0    0  0  1
*/