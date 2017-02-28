// -------------------------
// Exemplo0035 - comparar
// Nome: Daniel Telles McGinnis
// Matricula: 435042
// -------------------------
// Previsão:
// A saída será um conjunto de três informações para cada
// par de valores: se a é menor, maior ou igual a b.
// Teste 1:
// Entradas: [a = 0101 e b = 0101], [a = 0010 e b = 0101],
// [a = 0101 e b = 1100] e [a = 1101 e b = 1001]
// Observações da saída:
// Estes testes não são exaustivos pois não
// são testados todas as possíveis combinações
// de entrada, mas os testes que foram feitos
// deram certo.
// -------------------------
// comparar
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

module SomadorSubtrator(output [3:0] s,
                 input [3:0] a, input [3:0] b, input carryIn);
	wire carry1;
	wire carry2;
	wire carry3;
	wire b0_condicionalmenteNegado;
	wire b1_condicionalmenteNegado;
	wire b2_condicionalmenteNegado;
	wire b3_condicionalmenteNegado;
	wire jogaFora;

	xor X0 (b0_condicionalmenteNegado, b[0], carryIn);
	xor X1 (b1_condicionalmenteNegado, b[1], carryIn);
	xor X2 (b2_condicionalmenteNegado, b[2], carryIn);
	xor X3 (b3_condicionalmenteNegado, b[3], carryIn);

	fullAdder N0 (s[0], carry1, a[0], b0_condicionalmenteNegado, carryIn);
	fullAdder N1 (s[1], carry2, a[1], b1_condicionalmenteNegado, carry1);
	fullAdder N2 (s[2], carry3, a[2], b2_condicionalmenteNegado, carry2);
	fullAdder N3 (s[3], jogaFora, a[3], b3_condicionalmenteNegado, carry3);
endmodule // SomadorSubtrator

module determinarZero(output e_igual_a_zero,
                      input [3:0] a);
	nor N0 (e_igual_a_zero, a[0], a[1], a[2], a[3]);
endmodule // determinarZero

module incrementar(output [3:0] s,
                   input [3:0] a);
	SomadorSubtrator ss (s, a, 4'b0001, 1'b0);
endmodule // incrementar

module decrementar(output [3:0] s,
                   input [3:0] a);
	SomadorSubtrator ss (s, a, 4'b0001, 1'b1);
endmodule // decrementar

module SomadorSubtrator5bits(output [4:0] s,
                 input [3:0] a, input [3:0] b, input carryIn);
	wire carry1;
	wire carry2;
	wire carry3;
	wire b0_condicionalmenteNegado;
	wire b1_condicionalmenteNegado;
	wire b2_condicionalmenteNegado;
	wire b3_condicionalmenteNegado;

	xor X0 (b0_condicionalmenteNegado, b[0], carryIn);
	xor X1 (b1_condicionalmenteNegado, b[1], carryIn);
	xor X2 (b2_condicionalmenteNegado, b[2], carryIn);
	xor X3 (b3_condicionalmenteNegado, b[3], carryIn);

	fullAdder N0 (s[0], carry1, a[0], b0_condicionalmenteNegado, carryIn);
	fullAdder N1 (s[1], carry2, a[1], b1_condicionalmenteNegado, carry1);
	fullAdder N2 (s[2], carry3, a[2], b2_condicionalmenteNegado, carry2);
	fullAdder N3 (s[3], s[4], a[3], b3_condicionalmenteNegado, carry3);
endmodule // SomadorSubtrator5bits

module multiplexador(output s,
                     input a, input b, input chave);
	wire intermediario1;
	wire intermediario2;
	wire intermediario3;
	and N0 (intermediario1, b, chave);
	not N1 (intermediario2, chave);
	and N2 (intermediario3, intermediario2, a);
	or N3 (s, intermediario1, intermediario3);
endmodule // multiplexador

module comparar(output menor, output maior, output igual,
                input [3:0] a, input [3:0] b);
	wire [4:0] s;
	wire s4negado;
	wire ultimosBitsSaoIguais;
	wire bitsRestantesTeem1;
	wire notMenor;
	SomadorSubtrator5bits ss5 (s, a, b, 1'b1);
	not N0 (s4negado, s[4]);
	xnor N1 (ultimosBitsSaoIguais, a[3], b[3]);
	multiplexador mpx (menor, s[4], s4negado, ultimosBitsSaoIguais);
	or N2 (bitsRestantesTeem1, s[0], s[1], s[2], s[3]);
	not N3 (notMenor, menor);
	and N4 (maior, notMenor, bitsRestantesTeem1);
	xnor N5 (igual, menor, maior);
endmodule // comparar

module test_comparar;
	// ------------------------- definir dados
	reg [3:0] x;
	reg [3:0] y;
	wire menor;
	wire maior;
	wire igual;
	comparar modulo (menor, maior, igual, x, y);
	// ------------------------- parte principal
	initial begin
		$display("Exemplo0035 - Daniel Telles McGinnis - 435042");
		$display("Test ALU's module");
		
		x = 4'b0101; y = 4'b0101;
		#1 $display("comparar(%b, %b):\nmenor = %b\nmaior = %b\nigual = %b", x, y, menor, maior, igual);
		
		x = 4'b0010; y = 4'b0101;
		#1 $display("comparar(%b, %b):\nmenor = %b\nmaior = %b\nigual = %b", x, y, menor, maior, igual);

		x = 4'b0101; y = 4'b1100;
		#1 $display("comparar(%b, %b):\nmenor = %b\nmaior = %b\nigual = %b", x, y, menor, maior, igual);

		x = 4'b1101; y = 4'b1001;
		#1 $display("comparar(%b, %b):\nmenor = %b\nmaior = %b\nigual = %b", x, y, menor, maior, igual);
	end
endmodule // test_comparar