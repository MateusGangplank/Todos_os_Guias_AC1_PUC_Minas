// Exemplo0031 - BASE
// Nome: Lucas Porto Lopes
// Matricula 451408

//gates
module f4(output [3:0] s,output [3:0] h, input [3:0] a, input [3:0] b);
	and (s[0], a[0], b[0]);
	or  (h[0], a[0], b[0]);
	and (s[1], a[1], b[1]);
	or  (h[1], a[1], b[1]);
	and (s[2], a[2], b[2]);
	or  (h[2], a[2], b[2]);
	and (s[3], a[3], b[3]);
	or  (h[3], a[3], b[3]);
	
endmodule

module teste_f4;
	reg[3:0] x;
	reg[3:0] y;
	wire[3:0] z;
	wire[3:0] w;
	
	f4 modulo (z, w, x, y);
	
	initial begin
		$display("Exemplo0031 - Lucas Porto Lopes - 451408");
		$display("test LU's module");
		
		x = 4'b0011;
		y = 4'b0101;
		
		#1
		$display("and gate: %3b & %3b = %3b", x, y, z);
		#1
		$display(" or gate: %3b | %3b = %3b", x, y, w);
		
	end
	
endmodule