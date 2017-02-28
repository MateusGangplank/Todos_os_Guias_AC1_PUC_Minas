// --------------------- 
// Exemplo0031 - LU and e or 
// Nome: Felipe Pacifico 
// Matricula: 389868
// --------------------- 

// --------------------- 
// -- f4 gate 
// --------------------- 
	module f4 (output [0:3] s0, input [0:3] a, input [0:3] b);
	assign s0 = a | b; 
	endmodule // f4 
	
	module f5 (output [3:0] s1, input [3:0] c, input [3:0] d);
	assign s1 = c & d;
	
	endmodule // f4

// --------------------- 
// -- test f4 
// --------------------- 
	module testf4; 
// ------------------------- dados locais 
	reg [3:0] w; // definir registrador
	reg [3:0] x;
	wire [3:0] y; // definir conexao (fio) 
	wire [3:0] z;
	f4 modulo (z, x, w);
	f5 modulo2 (y, x, w);
// ------------------------- parte principal 
	initial begin
		$display("Exemplo0031 - Felipe Pacifico - 389868"); 
		$display("Test LU and e or"); 
	w = 4'b0011;
	x = 4'b0101;
	#1 $display("%b & %b = %b", w, x, y);
	#1 $display("%b | %b = %b", w, x, z);
	w = 4'b0000;
	x = 4'b0000;
	#1 $display("%b & %b = %b", w, x, y);
	#1 $display("%b | %b = %b", w, x, z);
	w = 4'b0010;
	x = 4'b0001;
	#1 $display("%b & %b = %b", w, x, y);
	#1 $display("%b | %b = %b", w, x, z);
	w = 4'b0001;
	x = 4'b0011;
	#1 $display("%b & %b = %b", w, x, y);
	#1 $display("%b | %b = %b", w, x, z);
	w = 4'b0101;
	x = 4'b0010;
	#1 $display("%b & %b = %b", w, x, y);
	#1 $display("%b | %b = %b", w, x, z);
	w = 4'b1010;
	x = 4'b0011;
	#1 $display("%b & %b = %b", w, x, y);
	#1 $display("%b | %b = %b", w, x, z);
	w = 4'b1001;
	x = 4'b0011;
	#1 $display("%b & %b = %b", w, x, y);
	#1 $display("%b | %b = %b", w, x, z);
	end 

endmodule // testf4 

// ------------------------- testes

/*
	Test LU and e or
	0011 & 0101 = 0001
	0011 | 0101 = 0111
	0000 & 0000 = 0000
	0000 | 0000 = 0000
	0010 & 0001 = 0000
	0010 | 0001 = 0011
	0001 & 0011 = 0001
	0001 | 0011 = 0011
	0101 & 0010 = 0000
	0101 | 0010 = 0111
	1010 & 0011 = 0010
	1010 | 0011 = 1011
	1001 & 0011 = 0001
	1001 | 0011 = 1011
*/