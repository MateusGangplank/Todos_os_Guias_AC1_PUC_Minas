// PUC Minas - Ciencia da Computacao - Arquitetura de Computadores I
// Exemplo0004 - OR 
// Nome: Ana Cristina Pereira Teixeira
// Matricula: 427385

// ------------------------- 
// -- or gate 
// ------------------------- 
module orgate ( output s, input p, q); 
	assign s = p | q; // vinculo permanente
endmodule // orgate

// --------------------- 
// -- test or gate 
// --------------------- 
module testorgate; 
// ------------------------- dados locais 
	reg a, b; // definir registradores 
	wire s; // definir conexao (fio) 
// ------------------------- instancia 
	orgate OR1 (s, a, b); 
// ------------------------- preparacao 
	initial begin:start 
		// atribuicao simultanea 
		// dos valores iniciais 
		a = 0; b = 0;
	end
// ------------------------- parte principal 
	initial begin 
		$display("Exemplo0004 - Ana Cristina - 427385");
		$display("Test OR gate");
		$display("\na | b = s\n");
		a = 0; b = 0;
		#1 $display("%b | %b = %b", a, b, s);
		a = 0; b = 1;
		#1 $display("%b | %b = %b", a, b, s);
		a = 1; b = 0;
		#1 $display("%b | %b = %b", a, b, s);
		a = 1; b = 1;
		#1 $display("%b | %b = %b", a, b, s);
	end
endmodule // testorgate