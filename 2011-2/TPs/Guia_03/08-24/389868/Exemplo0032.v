// ------------------------- 
// Exemplo0032 - LU and e or
// Nome: Felipe Pacifico
// Matricula: 389868
// ------------------------- 
// ------------------------- 
// f4_gate 
// ------------------------- 
module cx1 (output [3:0] s2, 
			          input [3:0] a, 
			          input [3:0] b, 
			          input [3:0] c); 
 assign s2 = (b & ~c) | (a & c); 
	endmodule // cx1
	
module f4 (output [3:0] s0, 
			  input [3:0] a, 
			  input [3:0] b); 
 assign s0 = (a | b);         
 	endmodule // f4 
	
module f5 (output [3:0] s1, 
			  input [3:0] a, 
			  input [3:0] b); 
 assign s1 = (a & b); 
	endmodule // f3 
	
	module test_f6; 
// ------------------------- definir dados 
	reg [3:0] w; 
	reg [3:0] x; 
	reg [3:0] chave; 
	wire [3:0] g; 
	wire [3:0] h; 
	wire [3:0] j;
	cx1 fox (j, h, g, chave);
	f4 domada (h, x, w); 
	f5 bilara (g, x, w); 
// ------------------------- parte principal 
initial begin 
	$display("Exemplo0032 - Felipe Pacifico - 389868"); 
	$display("Test LU's module"); 
	w = 4'b0011; x = 4'b0101;
	#1 chave = 4'b1111;
	$monitor("%b (& ou |) %b com chave %b = %b", w, x, chave, j); 
	#2 chave = 4'b0000;
	
	w = 4'b0000; x = 4'b0000;
	#1 chave = 4'b1111;
	$monitor("%b (& ou |) %b com chave %b = %b", w, x, chave, j); 
	#2 chave = 4'b0000;
	
	w = 4'b0010; x = 4'b0001;
	#1 chave = 4'b1111;
	$monitor("%b (& ou |) %b com chave %b = %b", w, x, chave, j); 
	#2 chave = 4'b0000;
	
	w = 4'b0001; x = 4'b0011;
	#1 chave = 4'b1111;
	$monitor("%b (& ou |) %b com chave %b = %b", w, x, chave, j); 
	#2 chave = 4'b0000;
	
	w = 4'b0101; x = 4'b0010;
	#1 chave = 4'b1111;
	$monitor("%b (& ou |) %b com chave %b = %b", w, x, chave, j); 
	#2 chave = 4'b0000;
	
	w = 4'b1010; x = 4'b0011;
	#1 chave = 4'b1111;
	$monitor("%b (& ou |) %b com chave %b = %b", w, x, chave, j); 
	#2 chave = 4'b0000;
	
	w = 4'b1001; x = 4'b0011;
	#1 chave = 4'b1111;
	$monitor("%b (& ou |) %b com chave %b = %b", w, x, chave, j); 
	#2 chave = 4'b0000;
end 
endmodule // test_f5 

/*
Test LU's module
0011 (& ou |) 0101 com chave 1111 = 0111
0000 (& ou |) 0000 com chave 0000 = 0000
0000 (& ou |) 0000 com chave 1111 = 0000
0010 (& ou |) 0001 com chave 0000 = 0000
0010 (& ou |) 0001 com chave 1111 = 0011
0001 (& ou |) 0011 com chave 0000 = 0001
0001 (& ou |) 0011 com chave 1111 = 0011
0101 (& ou |) 0010 com chave 0000 = 0000
0101 (& ou |) 0010 com chave 1111 = 0111
1010 (& ou |) 0011 com chave 0000 = 0010
1010 (& ou |) 0011 com chave 1111 = 1011
1001 (& ou |) 0011 com chave 0000 = 0001
1001 (& ou |) 0011 com chave 1111 = 1011
1001 (& ou |) 0011 com chave 0000 = 0001
*/