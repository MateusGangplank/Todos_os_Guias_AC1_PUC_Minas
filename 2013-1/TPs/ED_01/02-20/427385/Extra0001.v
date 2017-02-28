// -- PUC Minas - Instituto de Ciencias Exatas e Informatica
// -- Ciencia da Computacao - Professor Theldo Cruz
// Nome: ANA CRISTINA PEREIRA TEIXEIRA
// Matricula: 427385

// 11 - Definir e testar um modulo com uma expressao envolvendo portas de um circuito capaz de receber um byte
// e retornar 1, se todos os seus bits forem iguais a 0
// Eh recomendavel simular o modulo no Logisim

// --------------------- 
// -- xnor gate
// --------------------- 
module xnor2gate (output s, input p, input q);
	// (ab) + (a'b')
	assign s0 = (p && q);
	assign s1 = ((~p) && (~q));
	assign s = s0 | s1;
endmodule // or2gate

// --------------------- 
// -- test xnorgate 
// --------------------- 
module testxnorgate;
	// ------------------------- dados locais
	reg [7:0] a; // definir registrador 
	wire z0, z1, z2, z3, z4, z5, s; // definir conexao (fio)
	
	// ------------------------- instancia
	xnor2gate XNOR1 (z0, a[0], a[1]);
	xnor2gate XNOR2 (z1, a[2], a[3]);
	xnor2gate XNOR3 (z2, a[4], a[5]);
	xnor2gate XNOR4 (z3, a[6], a[7]);
	xnor2gate XNOR5 (z4, z0, z1);
	xnor2gate XNOR6 (z5, z2, z3);
	xnor2gate XNOR7 (s, z4, z5);
	
	// ------------------------- preparacao
	initial begin:start
		a = 8'b00000000;
	end
	
	// ------------------------- parte principal
	initial begin:main
		$display("Extra 0001 - ANA CRISTINA - 427385");
		$display("Test xnor gate");
		
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

// -- Testes
// Extra 0001 - ANA CRISTINA - 427385
// Test xnor gate
// 00000000 = 1
// 00000001 = 0
// 00000010 = 0
// 00000100 = 0
// 00001000 = 0
// 00010000 = 0
// 00100000 = 0
// 01000000 = 0
// 11111111 = 1