// -------------------------
// Exemplo0021 - Somador
// Nome: Daniel Telles McGinnis
// Matricula: 435042
// -------------------------
// Previsão:
// A saída será um valor de 4 bits
// igual à soma dos dois operandos
// de 4 bits cada, e o vai-um.
// Teste 1:
// Entradas: [a = 0000 e b = 0000], [a = 1111 e b = 1111],
// [a = 0101 e b = 1111] e [a = 1010 e b = 0000]
// Observações da saída:
// Estes testes não são exaustivos pois não
// são testados todas as possíveis combinações
// de entrada, mas os testes que foram feitos
// deram certo.
// -------------------------
// somador
// -------------------------
module halfAdder (output s, output c,
                  input a, input b);
	xor N0 (s, a, b);
	and N1 (c, a, b);
endmodule // halfAdder

module fullAdder (output s0, output s1,
                  input a, input b, input c);
	wire a_mais_b_s;
	wire a_mais_b_carry;
	wire segundoCarry;
	halfAdder N0 (a_mais_b_s, a_mais_b_carry, a, b);
	halfAdder N1 (s0, segundoCarry, a_mais_b_s, c);
	or N2 (s1, segundoCarry, a_mais_b_carry);
endmodule // fullAdder

module circuito4bitAdder(output [3:0] s, output carry,
                 input [3:0] a, input [3:0] b);
	wire carry1;
	wire carry2;
	wire carry3;
	fullAdder N0 (s[0], carry1, a[0], b[0], 1'b0);
	fullAdder N1 (s[1], carry2, a[1], b[1], carry1);
	fullAdder N2 (s[2], carry3, a[2], b[2], carry2);
	fullAdder N3 (s[3], carry, a[3], b[3], carry3);
endmodule // circuito4bitAdder

module test_4bitAdder;
	// ------------------------- definir dados
	reg [3:0] x;
	reg [3:0] y;
	wire [3:0] s;
	wire carry;
	circuito4bitAdder modulo (s, carry, x, y);
	// ------------------------- parte principal
	initial begin
		$display("Exemplo0021 - Daniel Telles McGinnis - 435042");
		$display("Test AU's module");
		
		x = 4'b0000; y = 4'b0000;
		#1 $display("%b + %b = %b + carry %b", x, y, s, carry);
		
		x = 4'b0000; y = 4'b1111;
		#1 $display("%b + %b = %b + carry %b", x, y, s, carry);

		x = 4'b0101; y = 4'b1010;
		#1 $display("%b + %b = %b + carry %b", x, y, s, carry);

		x = 4'b1111; y = 4'b0001;
		#1 $display("%b + %b = %b + carry %b", x, y, s, carry);
	end
endmodule // test_4bitAdder