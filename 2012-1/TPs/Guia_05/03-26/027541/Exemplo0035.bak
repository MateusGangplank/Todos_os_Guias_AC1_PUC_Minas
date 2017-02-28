// ------------------------- 
// --Exemplo0035 - F4  
// --Nome:Milton costa teles da silva
// --Matricula: 002751
// ------------------------- 

// ------------------------- 
// --f4_gate 
// ------------------------- 

module f4 (output [3:0] s0,output [3:0] s1, input [3:0] a, input [3:0] b, input[3:0] c); 
	assign s0 [3:0] = (~(a & b) & c)|(~(a & b) & c)|((a & b) & ~c)|((a | b) & ~c);
   assign s1 [3:0] = ((a ^ b) & c)|(~(a | b) & c)|(~(a & b) & ~c)|(~(a | b) &~c);	
endmodule // f4 

module testef4; 
// ------------------------- definir dados 
  reg [3:0] x; 
	reg [3:0] y; 
	reg [3:0] z;
	wire [3:0] sa;
   wire [3:0] sb;
	
	f4 modulo (sa,sb, x, y, z); 	
// ------------------------- parte principal 
initial begin 
		$display("Exemplo0035 -Milton costa teles da silva - 002751"); 
		$display("Test LU's module"); 
		x = 4'b0011; y = 4'b0101; z = 4'b0010;
		#1 $display("\n%3b  %3b %3b = %3b %3b",x,y,z,sa,sb); 
end
endmodule // testef4 