// PUC Minas - Ciencia da Computacao - Arquitetura de Computadores I
// Exemplo0003 - AND 
// Nome: Ana Cristina P. Teixeira 
// Matricula: 427385 

// ------------------------- 
// -- and gate 
// ------------------------- 
module andgate ( output s, input p, input q);
	assign s = p & q; // vinculo permanente input01 AND input02
endmodule // andgate

// --------------------- 
// -- test and gate 
// --------------------- 
module testandgate; 
// ------------------------- dados locais 
	reg a, b; // definir registradores 
	wire s; // definir conexao (fio) 
// ------------------------- instancia 
	andgate AND1 (s, a, b); // input = reg a, reg b output: wire s
// ------------------------- preparacao 
	initial begin:start 
		// atribuicao simultanea
		// dos valores iniciais
		a = 0; b = 0;
	end 
// ------------------------- parte principal 
	initial begin 
		$display("Exemplo0003 - Ana Cristina - 427385");
		$display("Test AND gate");
		$display("\na & b = s\n");
		a = 0; b = 0;
		// mudar registradores para a = 0 AND b = 1, apos 1u de tempo e usar modulo andgate pra gerar output
		#1 $display("%b & %b = %b", a, b, s); 
		a = 0; b = 1;
		// mudar registradores para a = 1 AND b = 0, apos 1u de tempo e usar modulo andgate pra gerar output
		#1 $display("%b & %b = %b", a, b, s); 
		a = 1; b = 0;
		// mudar registradores para a = 1 AND b = 1, apos 1u de tempo e usar modulo andgate pra gerar output 
		#1 $display("%b & %b = %b", a, b, s); 
		a = 1; b = 1; 
		#1 $display("%b & %b = %b", a, b, s); 
	end
endmodule // testandgate