// ------------------------- 
// Exemplo0031 - F4 
// Nome: Ana Cristina Pereira Teixeira
// Matricula: 427385
// -------------------------

// -------------------------
// f4_gate
// -------------------------
module f4 (output [3:0] s, output [3:0] s1, input [3:0] a, input [3:0] b);
	// ------------------------- descrever por portas
	// operacoes logicas bit a bit
	
	and AND1(s[0],a[0],b[0]);
	and AND2(s[1],a[1],b[1]);
	and AND3(s[2],a[2],b[2]);
	and AND4(s[3],a[3],b[3]);
	
	or OR1(s1[0],a[0],b[0]);
	or OR2(s1[1],a[1],b[1]);
	or OR3(s1[2],a[2],b[2]);
	or OR4(s1[3],a[3],b[3]);
endmodule // f4 

module test_f4;
	// ------------------------- definir dados
	reg [3:0] x;
	reg [3:0] y;
	
	wire [3:0] z;
	wire [3:0] z1;
	
	f4 modulo (z, z1, x, y);
	
	// ------------------------- parte principal 
	initial begin
	$display("Exemplo0031 - Ana Cristina Pereira Teixeira - 427385");
	$display("Test LU's module");
	
	x = 4'b0011; y = 4'b0101;
	
	// ------------------------- projetar testes do modulo
	$display("x \ty \tAND \tOR");
	#1 $display("%3b \t%3b \t%3b \t%3b", x, y, z, z1);
	end
endmodule // test_f4

// ------------------------- previsao de testes
// gate	x		op		y		s
//  AND	0011	&		0101	0001
//	  OR	0011 	|		0101 	0111
//   f4	0011 			0101 	0xx1