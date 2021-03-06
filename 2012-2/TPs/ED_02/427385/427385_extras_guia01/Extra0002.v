// PUC Minas - Ciencia da Computacao - Arquitetura de Computadores I
// Nome: Ana Cristina Pereira Teixeira
// Matricula: 427385

// 12.) Definir e testar um m�dulo com uma express�o envolvendo portas de um circuito capaz de receber um byte
// e retornar 1, se algum de seus bits for igual a 1.

// --------------------- 
// -- and gate
// --------------------- 
module and2gate (output s, input p, input q);
	assign s = p && q;
endmodule // or2gate

// --------------------- 
// -- test andgate 
// --------------------- 
module testandgate; 
// ------------------------- dados locais 
	reg [7:0] a; // definir registrador 
	wire z0, z1, z2, z3, z4, z5, s; // definir conexao (fio) 
// ------------------------- instancia 
	and2gate AND1 (z0, a[0], a[1]);
	and2gate AND2 (z1, a[2], a[3]);
	and2gate AND3 (z2, a[4], a[5]);
	and2gate AND4 (z3, a[6], a[7]);
	
	and2gate AND5 (z4, z0, z1);
	and2gate AND6 (z5, z2, z3);
	
	and2gate AND7 (s, z4, z5);
// ------------------------- preparacao
	initial begin:start
		a = 8'b00000000;
	end
// ------------------------- parte principal
	initial begin:main
		$display("Extra0002 - Guia01 - Ana Cristina - 427385");
		$display("Test and gate");
		$monitor("%8b = %b", a, s);
		#1 a = 8'b00000001;
		#1 a = 8'b00000010;
		#1 a = 8'b00000100;
		#1 a = 8'b00001000;
		#1 a = 8'b00010000;
		#1 a = 8'b00100000;
		#1 a = 8'b01000000;

		#1 a = 8'b11111111;
	end
endmodule // testandgate