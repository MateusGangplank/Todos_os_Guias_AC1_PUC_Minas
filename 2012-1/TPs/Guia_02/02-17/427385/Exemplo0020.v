// ------------------------- 
// Exemplo0020 - BASE - EXERCICIOS
// Nome: Ana Cristina Pereira Teixeira
// Matricula: 427385
// -------------------------

// -------------------------
// 05. Executar as operações abaixo, armazenar seus dados e resultados em registradores
// e mostrar os valores resultantes em binário, usar 8 bits e complemento de 2 nas subtrações:
// -------------------------
// a.) 101010(2) - 1101(2)
// b.) 11010(2) - 15(8)
// c.) 34(8) - B(16)
// d.) CA(16) - 10111001(2)
// e.) 25 - 1A(16)
// -------------------------

module test_operations_05;
// ------------------------- definir dados
	reg [7:0] a;
	reg [7:0] b;
	reg [7:0] c;
	reg [7:0] d;
	reg [7:0] e;
// ------------------------- parte principal
	initial begin
		$display("Exemplo0020 - EXERCICIOS - Ana Cristina Pereira Teixeira - 427385");
		$display("Exercio0005 - ModuleTest");
		
		a = 6'b101010 + (~(4'b1101) + 1'b1);
		b = 5'b11010 + (~(4'b1101) + 1'b1);
		c = 5'b11100 + ~(4'hB) + 1'b1;
		d = 8'hCA + ~(8'b10111001) + 1'b1;
		e = 5'd25 + ~(5'h1A) + 1'b1;
		
		$display("\nOperations Exercicio0005");
		$display("a.) 101010(2) - 1101(2) = %b", a);
		$display("b.) 11010(2) - 15(8) = %b", b);
		$display("c.) 34(8) - B(16) = %b", c);
		$display("d.) CA(16) - 10111001(2) = %b", d);
		$display("e.) 25 - 1A(16) = %b", e);
	end
endmodule // test_base