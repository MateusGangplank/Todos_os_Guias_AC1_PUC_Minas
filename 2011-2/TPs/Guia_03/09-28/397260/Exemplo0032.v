
// Exemplo0032 - LU and e or
// Nome: Pedro Henrique H. Guedes
// Matricula: 397260

// f4_gate 

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