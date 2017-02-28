// --------------------- 
// Extra0002
// Nome: Ana Cristina Pereira Teixeira
// Matricula: 427385
// 12. Definir e testar um módulo com uma expressão envolvendo portas de um circuito capaz de receber um byte
// e retornar 1, se algum de seus bits for igual a 1.
// É recomendável simular o módulo no Logisim.
// ---------------------

// --------------------- 
// -- or gate 
// --------------------- 
module or1gate (output s, input a, input b, input c, input d);
	assign s = a | b | c | d;
endmodule // or

// --------------------- 
// -- or gate 
// --------------------- 
module or2gate (output s, input p, input q, input r, input t);
	assign s = a | b | c | d;
endmodule // or

// --------------------- 
// -- or gate 
// --------------------- 
module or3gate (output s, input u, input v);
	assign s = u|v;
endmodule // or

// --------------------- 
// -- circuito 
// --------------------- 
module circuito; 
// ------------------------- dados locais 
	reg a, b, c, d, p, q, r, t; // definir registrador 
	wire s; // definir conexao (fio) 
// ------------------------- instancia 
	or OR1 (s1, a, b, c,d);
	or OR2(s2, p, q, r, t);
	or OR3(s, s1, s2);
// ------------------------- preparacao
	initial begin:start
		a = 0; b = 0; c = 0; d = 0; p = 0; q = 0; r = 0; t = 0;
	end
// ------------------------- parte principal
	initial begin:main
		$display("Extra0002 - Ana Cristina Pereira Teixeira - 427385");
		$display("Teste Circuito");
		$monitor("%b %b %b %b %b %b %b %b = %b", a, b, c, d, p, q, r, t, s);
		#1 a = 0; b = 0; c = 0; d = 0; p = 0; q = 0; r = 0; t = 0;
		#1 a = 1; b = 0; c = 0; d = 0; p = 0; q = 0; r = 0; t = 0;
		#1 a = 0; b = 1; c = 0; d = 0; p = 0; q = 0; r = 0; t = 0;
		#1 a = 0; b = 0; c = 1; d = 0; p = 0; q = 0; r = 0; t = 0;
		#1 a = 0; b = 0; c = 0; d = 1; p = 0; q = 0; r = 0; t = 0;
		#1 a = 0; b = 0; c = 0; d = 0; p = 1; q = 0; r = 0; t = 0;
		#1 a = 0; b = 0; c = 0; d = 0; p = 0; q = 1; r = 0; t = 0;
		#1 a = 0; b = 0; c = 0; d = 0; p = 0; q = 0; r = 1; t = 0;
		#1 a = 0; b = 0; c = 0; d = 0; p = 0; q = 0; r = 0; t = 1;
		
	end
endmodule // test

// 8 entradas e 1 saida
// 4 entradas para OR
// 4 entradas para OR
// OR + OR = OR