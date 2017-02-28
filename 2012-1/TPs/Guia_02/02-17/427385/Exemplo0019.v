// ------------------------- 
// Exemplo0019 - BASE - EXERCICIOS
// Nome: Ana Cristina Pereira Teixeira
// Matricula: 427385
// -------------------------

// -------------------------
// 04.) Calcular e mostrar o complemento de 2 de cada um dos valores abaixo armazenados em registrador(es): 
// -------------------------
// a.) 101010(2)	com 8 bits de comprimeto
// b.) 123(4)		com 7 bits de comprimeto
// c.) 23(10)		com 6 bits de comprimeto
// d.) E(16)		com 5 bits de comprimeto
// e.) 26(8)		com 8 bits de comprimeto
// -------------------------

module test_operations_04;
// ------------------------- definir dados
	reg [7:0] a;
	reg [6:0] b;
	reg [5:0] c;
	reg [4:0] d;
	reg [7:0] e;
// ------------------------- parte principal
	initial begin
		$display("Exemplo0019 - EXERCICIOS - Ana Cristina Pereira Teixeira - 427385");
		$display("Exercio0004 - ModuleTest");
		
		a = ~(6'b101010) + 1'b1;
		b = ~(6'b11011) + 1'b1;
		c = ~(23) + 1'b1;
		d = ~(4'hE) + 1'b1;
		e = ~(5'o26) + 1'b1;
		
		$display("\nOperations Exercicio0004");
		$display("a.) 101010(2) = C(2)a = %b", a);
		$display("b.) 123(4) = C(2)b = %b", b);
		$display("c.) 23(10) = C(2)c = %b", c);
		$display("d.) E(16) = C(2)d = %b", d);
		$display("e.) 26(8) = C(2)e = %b", e);
	end
endmodule // test_base