// ------------------------- 
// Exemplo0031 - LU and e or
// Nome: Pedro Henrique Vilar Locatelli 
// Matricula: 427453 
// ------------------------- 
// ------------------------- 
// f4_gate 
// ------------------------- 
module f4 (output [3:0] s0, 
			  input [3:0] a, 
			  input [3:0] b); 
 assign s0 = (a | b); 
	endmodule // f4 
module f3 (output [3:0] s1, 
			  input [3:0] c, 
			  input [3:0] d); 
 assign s1 = (c & d); 
	endmodule // f3 
	module test_f5; 
// ------------------------- definir dados 
	reg [3:0] w; 
	reg [3:0] x; 
	wire [3:0] y; 
	wire [3:0] z; 
	f4 modulo (z, x, w); 
	f3 modoom (y, x, w); 
// ------------------------- parte principal 
initial begin 
	$display("Exemplo0031 - Pedro Henrique Vilar Locatelli - 427453"); 
	$display("Test LU's module"); 
	w = 4'b0011; x = 4'b0101; 
	// projetar testes do modulo 
	#1 $display("%b & %b = %b", w, x, y);
	#1 $display("%b | %b = %b", w, x, z); 

end 
endmodule // test_f5 