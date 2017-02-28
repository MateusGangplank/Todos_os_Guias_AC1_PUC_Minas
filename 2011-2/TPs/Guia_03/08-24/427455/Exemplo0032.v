// ------------------------- 
// Exemplo0032 - AND_OR 
// Nome: Pedro Ballona 
// Matricula: 427455
// ------------------------- 
 
// ------------------------- 
//  AND_OR_gate 
// ------------------------- 
module AND_OR (output [3:0] s1,  
                    input  [3:0] a, 
                    input  [3:0] b,
						  input  [3:0] e); 
wire [3:0] or1;
wire [3:0] and1;
wire [3:0] and2;
wire [3:0] and3;
wire [3:0] or2;

assign or1 = a|b;
assign and1 = a&b;

assign and2 = and1 & e;

assign and3 = or1 & ~e;

assign s1 = and2 | and3;


 
endmodule // AND_OR 
 
module test_f4; 
// ------------------------- definir dados 
       reg  [3:0] x; 
       reg  [3:0] y;
		 reg  [3:0] a;
		 wire [3:0] z; 
        
 
       AND_OR modulo (z, x, y, a); 
 
// ------------------------- parte principal 
 
   initial begin 
      $display("Exemplo0032 - Pedro Ballona - 427455"); 
      $display("Test LU's module"); 
 
      x = 4'b0110;       y = 4'b1001;  a = 4'b0000;
 
   // projetar testes do modulo 
   #1 $display("%3b %3b %3b %3b",x,y,a,z); 
 
   end 
 
endmodule // test_f4