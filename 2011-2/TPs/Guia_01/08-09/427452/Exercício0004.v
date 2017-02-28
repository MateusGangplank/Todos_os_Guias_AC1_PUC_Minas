// -------------------------
// Exercicio0004 - AND
// Nome: Pedro Henrique Alves M. de Carvalho
// Matricula: 427452
// -------------------------

// -------------------------
// -- and gate
// -------------------------
module andgate (output s, input p, input q, input r);
 assign s = p & (q & r);
endmodule // fim do andgate

// -------------------------
// -- ex and gate
// -------------------------
module exandgate;
// ------------------------- dados locais
	reg a, b, c;	// definir registrador
	wire s;	// definir conexao (fio)
// ------------------------- instancia
 andgate AND1 (s, a, b, c);
// ------------------------- preparacao
 initial begin:start
	a=0; b=0; c=0;
 end
 
// ------------------------- parte principal
 initial begin:main
	$display("Exercício 0004 - Pedro Henrique A. M. de Carvalho - 427452");
	$display("Ex AND gate");
	$display("\n ( a & ( b & c )) = s\n");
 	
	a=0; b=0; c= 0;
 #1 $display(" %b & ( %b & %b ) = %b", a, b, c, s);
	a=0; b=0; c= 1;
 #1 $display(" %b & ( %b & %b ) = %b", a, b, c, s);
	a=0; b=1; c= 0;
 #1 $display(" %b & ( %b & %b ) = %b", a, b, c, s);
	a=0; b=1; c= 1;
 #1 $display(" %b & ( %b & %b ) = %b", a, b, c, s);
 	a=1; b=0; c= 0;
 #1 $display(" %b & ( %b & %b ) = %b", a, b, c, s);
	a=1; b=0; c= 1;
 #1 $display(" %b & ( %b & %b ) = %b", a, b, c, s);
	a=1; b=1; c= 0;
 #1 $display(" %b & ( %b & %b ) = %b", a, b, c, s);
	a=1; b=1; c= 1;
 #1 $display(" %b & ( %b & %b ) = %b", a, b, c, s);
 end

endmodule