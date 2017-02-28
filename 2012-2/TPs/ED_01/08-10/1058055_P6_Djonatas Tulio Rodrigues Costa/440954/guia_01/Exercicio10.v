// -------------------------
// Exercicio10 - (OR com 4 entradas - modulo que usa outros modulos OR de 2 entradas)
// Nome: Djonatas Tulio Rodrigues Costa
// Matricula: 440954
// -------------------------

// -------------------------
// -- or gate
// -------------------------
module orgate (output s, input a, input b);
	assign s = a | b;
endmodule // orgate

// -------------------------
// -- test or gate
// -------------------------
module testorgate;
// ------------------------- dados locais
	reg a, b, c, d;		// definir registrador
				// (variavel independente)
	wire s, p, q;		// definir conexao (fio)
				// (variavel dependente)
// ------------------------- instancia
	orgate OR1 (s, a, b);
	orgate OR2 (p, c, d);
	orgate OR3 (q, s, p);
// ------------------------- preparacao
	initial begin:start
		a=0; b=0; c=0; d=0;
	end
// ------------------------- parte principal
	initial begin:main
		$display("Exercicio10 - Djonatas Tulio Rodrigues Costa - 440954");
		$display("Test OR gate");
		$display("\na | b | c | d = s\n");
		$monitor("%b | %b | %b | %b = %b", a, b, c, d, q);
	#1 a=0; b=0; c=0; d=1;
	#1 a=0; b=0; c=1; d=0;
	#1 a=0; b=0; c=1; d=1;
	#1 a=0; b=1; c=0; d=0;
	#1 a=0; b=1; c=0; d=1;
	#1 a=0; b=1; c=1; d=0;
	#1 a=0; b=1; c=1; d=1;
	#1 a=1; b=0; c=0; d=0;
	#1 a=1; b=0; c=0; d=1;
	#1 a=1; b=0; c=1; d=0;
	#1 a=1; b=0; c=1; d=1;
	#1 a=1; b=1; c=0; d=0;
	#1 a=1; b=1; c=0; d=1;
	#1 a=1; b=1; c=1; d=0;
	#1 a=1; b=1; c=1; d=1;
	end
	
endmodule // testorgate
