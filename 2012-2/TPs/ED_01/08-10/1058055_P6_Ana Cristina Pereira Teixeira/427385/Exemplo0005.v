// PUC Minas - Ciencia da Computacao - Arquitetura de Computadores I
// Exemplo0005 - xor 
// Nome: Ana Cristina P. Teixeira
// Matricula: 427385

// --------------------- 
// -- xor gate 
// --------------------- 
module xorgate (output [0:3] s, input [0:3] p, input [0:3] q); // input big endian 4 valores binarios
	assign s = p ^ q; // vinculo permanente
endmodule // xor

// --------------------- 
// -- test xorgate 
// --------------------- 
module testxorgate; 
// ------------------------- dados locais 
	reg [0:3] a, b; // definir registrador 
	wire [0:3] s; // definir conexao (fio) 
// ------------------------- instancia 
	xorgate XOR1 (s, a, b);
// ------------------------- preparacao 
	initial begin:start 
		a = 4'b0011; // 4 valores binarios
		b = 4'b0101; // 4 valores binarios
	end 
// ------------------------- parte principal 
	initial begin:main 
		$display("Exemplo0005 - Ana Cristina - 427385"); 
		$display("Test xor gate"); 
		$display("\n a ^ b = s\n"); 
		$monitor("%b ^ %b = %b", a, b, s); 
		#1 a = 0; b = 0; // valores decimais
		#1 a = 4'b0010; b = 4'b0001; // valores binarios
		#1 a = 4'd1; b = 3; // decimal e decimal
		#1 a = 4'o5; b = 2; // octal e decimal
		#1 a = 4'hA; b = 3; // hexadecimal e decimal
		#1 a = 4'h9; b = 4'o3; // hexadecimal e octal
	end
endmodule // testxorgate

// previsao de testes
// valores iniciais, 4 valores binarios - a = 4'b0011 = 0011(2) = 3(10) e b = 4'b0101 = 0101(2) = 5(10)
// a = 0; b = 0; // valores decimais - 0(10) e 0(10), 0000(2) e 0000(2)
//	a = 4'b0010; b = 4'b0001; // valores binarios - 2(2) e 1(2), 0010(2) e 0001(2)
// a = 4'd1; b = 3; // decimal e decimal - 1(10) e 3(10), 0001(2) e 0011(2)
// a = 4'o5; b = 2; // octal e decimal - 5(8) e 2(10), 0101(2) e 0010(2)
// a = 4'hA; b = 3; // hexadecimal e decimal - A(16) e 3(10), 1010(2) e 0011(2)
// a = 4'h9; b = 4'o3; // hexadecimal e octal - 9(16) e 3(8), 1001(2) e 0011(2)
// conclusao - todas as bases multiplas de 2 serao convertidas para valores binarios