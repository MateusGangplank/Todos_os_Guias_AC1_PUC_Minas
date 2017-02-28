// ------------------------- 
// Exemplo0033 - AND_OR_NAND_NOR 
// Nome: Pedro Ballona 
// Matricula: 427455
// ------------------------- 
 
// ------------------------- 
//  AND_OR_gate 
// ------------------------- 
module AND_OR_NAND_NOR (output [3:0] s1, output [3:0] s2, 
                    input  [3:0] a, 
                    input  [3:0] b,
						  input  [3:0] e); 
wire [3:0] or1;
wire [3:0] and1;
wire [3:0] nand1;
wire [3:0] nor1;

wire [3:0] and2;
wire [3:0] and3;

wire [3:0] and4;
wire [3:0] and5;

wire [3:0] or2;
wire [3:0] or3;

assign or1 = a|b;
assign and1 = a&b;
assign nand1 = ~(a&b);
assign nor1 = ~(a|b);

assign and2 = and1&~e;
assign and3 = or1&~e;

assign and4 = nand1& (e);
assign and5 = nor1&  (e);

assign s1 = and2|and4;
assign s2 = and3|and5;



 
endmodule // AND_OR_NAND_NOR 
 
module test_f4; 
// ------------------------- definir dados 
       reg  [3:0] x; 
       reg  [3:0] y;
		 reg  [3:0] a;
		 wire [3:0] z;
		 wire [3:0] j; 
        
 
       AND_OR_NAND_NOR modulo (z, j, x, y, a); 
 
// ------------------------- parte principal 
 
   initial begin 
      $display("Exemplo0032 - Pedro Ballona - 427455"); 
      $display("Test LU's module"); 
 
      x = 4'b0110;       y = 4'b1001;  a = 4'b1111;
 
   // projetar testes do modulo 
   #1 $display("%3b %3b %3b %3b %3b",x,y,a,z,j); 
 
   end 
 
endmodule // test_f4