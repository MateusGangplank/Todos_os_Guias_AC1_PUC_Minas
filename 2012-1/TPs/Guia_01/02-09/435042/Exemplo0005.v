// --------------------- 
// Exemplo0005 - xor 
// Nome: Daniel Telles McGinnis 
// Matricula: 435042
// --------------------- 
// Alterações feitas:
// Troquei a porta OR pela porta XOR.
// Em vez de usar $display, esse programa usa $monitor.
// Previsão:
// A saída é a disjunção exclusiva das entradas.
// Teste 1:
// Entradas: (a=0011 binário e b=0101 binário), (a=0 e b=0),
// (a=0010 binário e b=0001 binário), (a=1 e b=3), (a=5 e b=2),
// (a=A hexadecimal e b=3) e (a=9 e b=3)
// Observações da saída:
// A saída é a tabela verdade da disjunção exclusiva
// das entradas, operação esta feita bit a bit.
// --------------------- 
// -- xor gate 
// --------------------- 
module xorgate (output [0:3] s, 
input [0:3] p, 
input [0:3] q); 
	assign s = p ^ q; 
endmodule // xor 
// --------------------- 
// -- test xorgate 
// --------------------- 
module testxorgate; 
	// ------------------------- dados locais 
	reg [0:3] a,b; // definir registrador 
	wire [0:3] s;  // definir conexao (fio) 
	// ------------------------- instancia 
	xorgate XOR1 (s, a, b); 
	// ------------------------- preparacao 
	initial begin:start 
		a=4'b0011; // 4 valores binarios 
		b=4'b0101; // 4 valores binarios 
	end 
	// ------------------------- parte principal 
	initial begin:main 
		$display("Exemplo0005 - Daniel Telles McGinnis - 435042"); 
		$display("Test xor gate"); 
		$display("\n a ^ b = s\n"); 
		$monitor("%b ^ %b = %b", a, b, s); 
		#1 a=0; b=0; // valores decimais 
		#1 a=4'b0010; b=4'b0001; // valores binarios 
		#1 a=4'd1; b=3; // decimal e decimal 
		#1 a=4'o5; b=2; // octal e decimal 
		#1 a=4'hA; b=3; // hexadecimal e decimal 
		#1 a=4'h9; b=4'o3; // hexadecimal e octal 
	end 
endmodule // testxorgate 