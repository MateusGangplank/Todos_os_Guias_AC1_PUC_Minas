// ------------------------- 
// --Exemplo0034 - F4  
// --Nome: Lorena Danielle Gonçalves Bento
// --Matricula: 435049
// ------------------------- 

// ------------------------- 
// --f4_gate 
// ------------------------- 

module f4 (output [6:0] s, input [3:0] a, input [3:0] b, input[3:0]c); 
	assign s[0:0] = ~a;
	assign s[1:0] = (a | b);
	assign s[2:0] = (~(a | b));
	assign s[3:0] = (a & b);
	assign s[4:0] = (~(a & b));
	assign s[5:0] = (a & b);
	assign s[6:0] = a;	
endmodule // f4 

module testef4; 
// ------------------------- definir dados 
reg [3:0] x; 
reg [3:0] y; 
reg [3:0] z;
wire [6:0] sa; 
	
f4 modulo (sa, z, x, y); 
	
// ------------------------- parte principal 
initial begin 
		$display("Exemplo0035 - Lorena Danielle Gonçalves Bento - 435049"); 
		$display("Test LU's module"); 
		x = 4'b0011; y = 4'b0101; z = 4'b0010;
		#1 $display("\n%3b  %3b = %3b",x,y,sa); 
end
endmodule // testef4 