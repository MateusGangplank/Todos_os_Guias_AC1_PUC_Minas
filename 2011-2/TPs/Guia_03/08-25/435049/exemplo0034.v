// ------------------------- 
//-- Exemplo0034 - F4  
// --Nome: Lorena Danielle Gonçalves Bento
// --Matricula: 435049
// ------------------------- 
// --XNOR_XOR  NOR_OR
// ------------------------- 
// --f4_gate 
// ------------------------- 

module f4 (output [7:0] s, input [3:0] a, input [3:0] b, input[3:0]c); 
	assign s[3:0] = ((a & b)&c) | (((a & b))&c);
	assign s[7:0] = ((a | b)&c) | ((~(a & b))&~c);
endmodule //--fim module f4 

module testef4; 
// ------------------------- definir dados 
	reg [3:0] x; 
	reg [3:0] y; 
	reg [3:0] z;
	wire [7:0] sa; 
	f4 modulo (sa, z, x, y); 
// ------------------------- parte principal 

initial begin 
$display("Exemplo0034 - Lorena Danielle Gonçalves Bento - 435049"); 
$display("Test LU's module"); 
		
x = 4'b0011; y = 4'b0111; z = 0; 
#1 $display("\n%3b  %3b = %3b",x,y,sa); 
		
	end
endmodule // testf4 