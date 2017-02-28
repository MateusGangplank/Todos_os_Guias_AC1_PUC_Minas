// --------------------- 
// Exemplo0006 - NAND 
// Nome: Daniel Telles McGinnis 
// Matricula: 435042
// --------------------- 
// Previsão:
// A saída é a negação da conjunção das entradas.
// Teste 1:
// Entradas: (a=0 e b=0), (a=0 e b=1), (a=1 e b=0) e (a=1 e b=1)
// Observações da saída:
// A saída é uma tabela verdade da negação da conjunção.
// --------------------- 
// -- nand gate 
// --------------------- 
module nandgate (output s, input p, input q); 
	assign s = ~(p&q); 
endmodule // nand gate
// --------------------- 
// -- test nandgate 
// --------------------- 
module testnandgate; 
	// ------------------------- dados locais 
	reg a, b; // definir registrador 
	wire s;   // definir conexao (fio) 
	// ------------------------- instancia 
	nandgate NAND1 (s, a, b); 
	// ------------------------- preparacao 
	initial begin:start 
		a=0;
		b=0;
	end 
	// ------------------------- parte principal 
	initial begin:main 
		$display("Exemplo0006 - Daniel Telles McGinnis - 435042"); 
		$display("Test nand gate"); 
		$display("~(a & b) = s\n");
		$display("  a   b    s");
		a=0; b=0;
		#1 $display("  %b   %b    %b", a, b, s);
		a=0; b=1;
		#1 $display("  %b   %b    %b", a, b, s);
		a=1; b=0;
		#1 $display("  %b   %b    %b", a, b, s);
		a=1; b=1;
		#1 $display("  %b   %b    %b", a, b, s);
	end 
endmodule // testnandgate 