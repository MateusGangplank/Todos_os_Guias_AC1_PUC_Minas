// -------------------------
// Exemplo0034 - decrementar
// Nome: Daniel Telles McGinnis
// Matricula: 435042
// -------------------------
// Previsão:
// A saída será um valor de 4 bits
// igual ao decremento da entrada.
// Teste 1:
// Entradas: a = 0000, a = 0010, a = 0101 e a = 1111
// Observações da saída:
// Estes testes não são exaustivos pois não
// são testados todas as possíveis combinações
// de entrada, mas os testes que foram feitos
// deram certo.
// -------------------------
// decrementar
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

module test_decrementar;
	// ------------------------- definir dados
	reg [3:0] x;
	wire [3:0] s;
	decrementar modulo (s, x);
	// ------------------------- parte principal
	initial begin
		$display("Exemplo0034 - Daniel Telles McGinnis - 435042");
		$display("Test ALU's module");
		
		x = 4'b0000;
		#1 $display("--%b = %b", x, s);
		
		x = 4'b0010;
		#1 $display("--%b = %b", x, s);

		x = 4'b0101;
		#1 $display("--%b = %b", x, s);

		x = 4'b1111;
		#1 $display("--%b = %b", x, s);
	end
endmodule // test_decrementar