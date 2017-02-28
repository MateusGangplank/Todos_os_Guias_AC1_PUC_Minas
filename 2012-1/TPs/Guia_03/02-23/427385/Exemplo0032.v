// ------------------------- 
// Exemplo0032 - F4 
// Nome: Ana Cristina Pereira Teixeira
// Matricula: 427385
// -------------------------

// -------------------------
// f4_gate
// -------------------------
module f4 (output [1:0] s, input [1:0] flag, input [1:0] a, input [1:0] b);

	wire [1:0] s1; // --- saida AND1
	wire [1:0] s2; // --- saida OR2
	
	wire [1:0] s3; // --- saida ANDA ( A para and )
	wire [1:0] s4; // --- saida ANDO ( O para or )

	// --- descrever por portas
	and AND1(s1[0],a[0],b[0]);
	and AND2(s1[1],a[1],b[1]);
	
	or OR1(s2[0],a[0],b[0]);
	or OR2(s2[1],a[1],b[1]);

	// --- selecionar operacao
	and ANDA1(s3[0],s1[0],flag[0]); // flag 1
	and ANDA2(s3[1],s1[1],flag[1]);
	
	and ANDO(s4[0],s2[0],~flag[0]); // ~flag 0
	and ANDO(s4[1],s2[1],~flag[1]);
	
	or ORF(s[0],s3[0],s4[0]);
	or ORF(s[1],s3[1],s4[1]);
endmodule // f4 

module test_f4;
	// --- definir dados
	reg [1:0] x;
	reg [1:0] y;
	reg [1:0] f; // flag
	
	wire [1:0] z; // saida

	f4 modulo (z, f, x, y);
	
	// --- parte principal 
	initial begin
	$display("Exemplo0032 - Ana Cristina Pereira Teixeira - 427385");
	$display("Test LU's module");
	
	x = 2'b11; y = 2'b01; f = 2'b00;
	
	// --- projetar testes do modulo
	$display("x \ty \tOR \tFlag");
	#1 $display("%3b \t%3b \t%3b  \t%3b", x, y, z, f);
	
	f = 2'b11;
	
	$display("x \ty \tAND \tFlag");
	#1 $display("%3b \t%3b \t%3b  \t%3b", x, y, z, f);
	
	
	end
endmodule // test_f4

// ------------------------- previsao de testes
// gate	x		op		y		s
//  AND	0011	&		0101	0001
//	  OR	0011 	|		0101 	0111
//   f4	0011 			0101 	0xx1