// -------------------------
// --Exemplo0033 - OR_AND e NOR_NAND - 
// --Nome: Lorena Danielle Gonçalves Bento
// --Matricula: 435049
// -------------------------
// ------------------------- 
//  --f4_gate 
// ------------------------- 


module f4 (output [7:0] s,input  [3:0] a, input  [3:0] b, input [3:0] c); 
assign s[3:0] = ((a | b) & c) | ((~(a | b)) & ~c);
assign s[7:4] = ((a & b) & c) | ((~(a & b)) & ~c);
 
endmodule // fim module f4

module testef4; 
	// ------------------------- definir dados 
	reg [3:0] x; 
	reg [3:0] y; 
	reg [3:0] s;
	wire [7:0] r; 
	
	f4 modulo (r, s, x, y); 
	
// ------------------------- parte principal 
 
initial begin 
      $display("Exemplo0033 - Lorena Danielle Gonçalves Bento - 435049");
      $display("Test LU's module"); 
	#1   x = 4'b0011;  y = 4'b0101; s = 0;
	#1 $display("\n%3b  %3b = %3b",x,y,s); 
 
     
   end 
 
endmodule // testef4  Exe0033
 
  