// -------------------------
// Exercicio0001 - NAND
// Nome: Pedro Henrique Alves M. de Carvalho
// Matricula: 427452
// -------------------------

// -------------------------
// -- nand gate
// -------------------------
module nandgate (output s, input p, input q);
 assign s = ( ~( p & q ));
endmodule // fim do nandgate

// -------------------------
// -- ex nand gate
// -------------------------
module exnandgate;
// ------------------------- dados locais
	reg a, b;	// definir registrador
	wire s;	// definir conexao (fio)
// ------------------------- instancia
 nandgate NAND1 (s, a, b);
// ------------------------- preparacao
 initial begin:start
	a=0; b=0;
 end
 
// ------------------------- parte principal
 initial begin:main
	$display("Exercício 0001 - Pedro Henrique A. M. de Carvalho - 427452");
	$display("Ex NAND gate");
	$display("\n ~ ( a & b ) = s\n");
 	
	a=0; b=0;
 #1 $display(" ~ ( %b & %b ) = %b", a, b, s);
	a=0; b=1;
 #1 $display(" ~ ( %b & %b ) = %b", a, b, s);
	a=1; b=0;
 #1 $display(" ~ ( %b & %b ) = %b", a, b, s);
	a=1; b=1;
 #1 $display(" ~ ( %b & %b ) = %b", a, b, s);
 end

endmodule