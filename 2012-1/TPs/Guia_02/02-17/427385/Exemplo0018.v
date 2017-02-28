// ------------------------- 
// Exemplo0018 - BASE - EXERCICIOS
// Nome: Ana Cristina Pereira Teixeira
// Matricula: 427385
// -------------------------

// -------------------------
// 03. Calcular e mostrar o complemento de 2 de cada um dos valores abaixo armazenados em registrador(es):
// -------------------------
// a.) 100111(2)
// b.) 23(8)
// c.) 23(10)
// d.) 2B(16)
// e.) 26 - 36
// -------------------------

module test_operations_03;
// ------------------------- definir dados
	reg [6:0] a;
	reg [5:0] b;
	reg [5:0] c;
	reg [6:0] d;
	reg [4:0] e;
// ------------------------- parte principal
	initial begin
		$display("Exemplo0018 - EXERCICIOS - Ana Cristina Pereira Teixeira - 427385");
		$display("Exercio0003 - ModuleTest");
		
		a = ~(6'b100111) + 1'b1;
		b = ~(6'o23) + 1'b1;
		c = ~(23) + 1'b1;
		d = ~(7'h2B) + 1'b1;
		e = ~(26 - 36) + 1'b1;
		
		$display("\nOperations Exercicio0003");
		$display("a.) 100111(2) = C(2)a = %b", a);
		$display("b.) 23(8) = C(2)b = %b", b);
		$display("c.) 23(10) = C(2)c = %b", c);
		$display("d.) 2B(16) = C(2)d = %b", d);
		$display("e.) 26 - 36 = C(2)e = %b", e);
	end
endmodule // test_base