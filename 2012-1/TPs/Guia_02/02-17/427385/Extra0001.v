// --------------------- 
// Extra0001 
// Nome: Ana Cristina Pereira Teixeira
// Matricula: 427385
// 11. Definir e testar um módulo com uma expressão envolvendo portas de um circuito capaz de receber um byte
// e retornar 1, se todos os seus bits forem iguais a 0.
// É recomendável simular o módulo no Logisim.
// ---------------------

// --------------------- 
// -- or gate 
// --------------------- 
module orgate (output s, input a, input b, input c, input d);
	assign s = a | b | c | d;
endmodule // or

// --------------------- 
// -- and gate 
// --------------------- 
module andgate (output s, input a, input b, input c, input d);
	assign s = a & b & c & d;
endmodule // and

// --------------------- 
// -- nor gate 
// --------------------- 
module norgate (output s, input p, input q);
	assign s = ~(~(p|q));
endmodule // nor

// --------------------- 
// -- circuito 
// --------------------- 
module circuito; 
// ------------------------- dados locais 
	reg a, b, c, d, p, q, r, t; // definir registrador 
	wire s; // definir conexao (fio) 
// ------------------------- instancia 
	or OR1 (s1, a, b, c,d);
	and AND1(s2, p, q, r, t);
	nor NOR1(s, s1, s2);
// ------------------------- preparacao
	initial begin:start
		a = 0; b = 0; c = 0; d = 0; p = 0; q = 0; r = 0; t = 0;
	end
// ------------------------- parte principal
	initial begin:main
		$display("Extra0001 - Ana Cristina Pereira Teixeira - 427385");
		$display("Teste Circuito");
		$display("(a | b | c | d) = s1\n(p & q & r & t) = s2\n~(~(s1 | s2)) = s");
		$monitor("(%b %b %b %b) = %b\n(%b %b %b %b) = %b\n~(~(s1 | s2)) = %b", a, b, c, d, s1, p, q, r, t, s2, s);
		#1 a = 0; b = 0; c = 0; d = 0; p = 0; q = 0; r = 0; t = 0;
	end
endmodule // test
