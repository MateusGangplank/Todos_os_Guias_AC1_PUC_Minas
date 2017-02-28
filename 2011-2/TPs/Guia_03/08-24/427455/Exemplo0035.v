// ------------------------- 
// Exemplo0035 - AND_OR_NAND_NOR 
// Nome: Pedro Ballona 
// Matricula: 427455
// ------------------------- 
 
// ------------------------- 
//  AND_OR_gate 
// ------------------------- 
module ODDMENT (output [3:0] s1, 
						  output [3:0] s2,
						  output [3:0] s3,
						  output [3:0] s4,
						  output [3:0] s5,
						  output [3:0] s6,
						  output [3:0] s7,
						  output [3:0] s8,
                    input  [3:0] a, 
                    input  [3:0] b); 
assign s1 = ~a;
assign s2 = ~b;
assign s3 = a|b;
assign s4 = a&b;
assign s5 = a~|b;
assign s6 = a~&b;
assign s7 = a^b;
assign s8 = a~^b;



 
endmodule // AND_OR_NAND_NOR 
 
module test_f4; 
// ------------------------- definir dados 
       reg  [3:0] x; 
       reg  [3:0] y;		 
		 wire [3:0] s1;
		 wire [3:0] s2;
		 wire [3:0] s3;
		 wire [3:0] s4;
		 wire [3:0] s5;
		 wire [3:0] s6;
		 wire [3:0] s7;
		 wire [3:0] s8;
		  
        
 
       ODDMENT modulo (s1,s2,s3,s4,s5,s6,s7,s8,x,y); 
 
// ------------------------- parte principal 
 
   initial begin 
      $display("Exemplo0032 - Pedro Ballona - 427455"); 
      $display("Test LU's module"); 
 
      x = 4'b0110;       y = 4'b1001;  
 
   // projetar testes do modulo 
   #1 $display("%3b %3b NOTX = %3b NOTY = %3b OR = %3b  AND = %3b NOR = %3b NAND = %3b XOR = %3b XNOR = %3b ",x,y,s1,s2,s3,s4,s5,s6,s7,s8); 
 		
		x = 4'b0111;       y = 4'b1101;  
 
   // projetar testes do modulo 
   #1 $display("%3b %3b NOTX = %3b NOTY = %3b OR = %3b  AND = %3b NOR = %3b NAND = %3b XOR = %3b XNOR = %3b ",x,y,s1,s2,s3,s4,s5,s6,s7,s8);
	   
		x = 4'b0111;       y = 4'b1111;  
 
   // projetar testes do modulo 
   #1 $display("%3b %3b NOTX = %3b NOTY = %3b OR = %3b  AND = %3b NOR = %3b NAND = %3b XOR = %3b XNOR = %3b ",x,y,s1,s2,s3,s4,s5,s6,s7,s8);
	   
		x = 4'b1110;       y = 4'b1101;  
 
   // projetar testes do modulo 
   #1 $display("%3b %3b NOTX = %3b NOTY = %3b OR = %3b  AND = %3b NOR = %3b NAND = %3b XOR = %3b XNOR = %3b ",x,y,s1,s2,s3,s4,s5,s6,s7,s8);
	   
		x = 4'b0100;       y = 4'b1011;  
 
   // projetar testes do modulo 
   #1 $display("%3b %3b NOTX = %3b NOTY = %3b OR = %3b  AND = %3b NOR = %3b NAND = %3b XOR = %3b XNOR = %3b ",x,y,s1,s2,s3,s4,s5,s6,s7,s8);
	   
	end 
 
endmodule // test_f4