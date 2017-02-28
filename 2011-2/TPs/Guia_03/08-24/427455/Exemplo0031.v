// ------------------------- 
// Exemplo0031 - F4 
// Nome: Pedro Ballona 
// Matricula: 427455 
// ------------------------- 
 
// ------------------------- 
//  f4_gate 
// ------------------------- 
module f4 (output [3:0] s1, output [3:0] s2,  
                    input  [3:0] a, 
                    input  [3:0] b); 
assign s1 = a | b;
assign s2 = a & b;
 
endmodule // f4 
 
module test_f4; 
// ------------------------- definir dados 
       reg  [3:0] x; 
       reg  [3:0] y; 
       wire [3:0] z;
		 wire [3:0] w; 
 
       f4 modulo (z, w, x, y); 
 
// ------------------------- parte principal 
 
   initial begin 
      $display("Exemplo0031 - Pedro Ballona - 427455"); 
      $display("Test LU's module"); 
 
      x = 4'b0011;       y = 4'b0101; 
 
   // projetar testes do modulo 
   #1 $display("%3b %3b %3b %3b",x,y,z,w); 
 
   end 
 
endmodule // test_f4