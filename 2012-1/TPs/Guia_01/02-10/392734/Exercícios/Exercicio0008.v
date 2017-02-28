// ------------------------- 
// Exerc�cio0008 - AND 
// Nome: Jo�o Henrique Mendes de Oliveira 
// Matricula: 392734
// -------------------------

// ------------------------- 
// -- and gate 
// ------------------------- 
 module andgate ( output s, input p, input q, input r); 
	assign s = (p * q) * r; 
 endmodule // andgate 
 
// --------------------- 
// -- test and gate 
// --------------------- 
 module testandgate; 
// ------------------------- dados locais 
	reg a, b, c; // definir registradores 
	wire s; // definir conexao (fio) 
// ------------------------- instancia 
	andgate AND1 (s, a, b, c); 
// ------------------------- preparacao 
	initial begin:start 
		// atribuicao simultanea 
		// dos valores iniciais 
		a = 0; b = 0; c = 0;
	end
	
// ------------------------- parte principal

	initial begin 
		$display("Exerc�cio0008 - Jo�o Henrique Mendes de Oliveira - 392734"); 
		$display("Test AND gate"); 
		$display("\n(a * b) * c = s\n"); 
		a = 0; b = 0; c = 0;
	#1 $display("(%b * %b) * %b = %b", a, b, c, s); 
		a = 0; b = 0; c = 1;
	#1 $display("(%b * %b) * %b = %b", a, b, c, s); 
		a = 0; b = 1; c = 0;
	#1 $display("(%b * %b) * %b = %b", a, b, c, s); 
		a = 0; b = 1; c = 1;
	#1 $display("(%b * %b) * %b = %b", a, b, c, s);
		a = 1; b = 0; c = 0;
	#1 $display("(%b * %b) * %b = %b", a, b, c, s);
		a = 1; b = 0; c = 1;
	#1 $display("(%b * %b) * %b = %b", a, b, c, s);
		a = 1; b = 1; c = 0;
	#1 $display("(%b * %b) * %b = %b", a, b, c, s);
		a = 1; b = 1; c = 1;
	#1 $display("(%b * %b) * %b = %b", a, b, c, s);
	end
	
	endmodule // testandgate 