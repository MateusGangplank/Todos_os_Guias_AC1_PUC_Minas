// -------------------------
// Exemplo0025 - C2
// Nome: Daniel Telles McGinnis
// Matricula: 435042
// -------------------------
// Previsão:
// A saída será o complemento
// de 2 da entrada de 4 bits.
// Teste 1:
// Entradas: [a = 0000], [a = 1111], [a = 0101] e [a = 0001]
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

module C2 (output [3:0] s,
           input [3:0] a);
	wire [3:0] intermediario;
	wire jogaFora;
	xor N0 (intermediario[0], a[0], 1'b1);
	xor N1 (intermediario[1], a[1], 1'b1);
	xor N2 (intermediario[2], a[2], 1'b1);
	xor N3 (intermediario[3], a[3], 1'b1);
	circuito4bitAdder N4 (s, jogaFora, intermediario, 4'b0001);
endmodule // C2

module test_C2;
	// ------------------------- definir dados
	reg [3:0] x;
	wire [3:0] s;
	C2 modulo (s, x);
	// ------------------------- parte principal
	initial begin
		$display("Exemplo0025 - Daniel Telles McGinnis - 435042");
		$display("Test LU's module");
		
		x = 4'b0000;
		#1 $display("C2(%b) = %b", x, s);
		
		x = 4'b1111;
		#1 $display("C2(%b) = %b", x, s);

		x = 4'b0101;
		#1 $display("C2(%b) = %b", x, s);

		x = 4'b0001;
		#1 $display("C2(%b) = %b", x, s);
	end
endmodule // test_C2