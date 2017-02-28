// ----------------------------------------
// Exemplo0005 - XOR
// Nome: João Henrique Mendes de Oliveira
// Matricula: 392734
// ----------------------------------------

// -------------------------
// -- xor gate
// -------------------------

module xorgate(output [0:3]s, input [0:3]p, input [0:3]q);
	assign s = p ^ q; //-- vinculo
endmodule //-- end module xorgate

// -------------------------
// -- test xor gate
// -------------------------

module testxorgate;
//-- dados locais
	reg [0:3]a, b; //-- reg = registrador = entrada
	wire [0:3]s; //-- wire = saída
	
//-- instanciando o "module or gate"
	xorgate XOR1(s, a, b);
	
//-- preparação
	initial begin:start
		a = 4'b0011; //-- nº binário de 4 bits
		b = 4'b0101; //-- nº binário de 4 bits
	end //-- end start

//-- parte principal
	initial begin:main
	//-- execução 1 à 1
		$display("Exemplo0005 - João Henrique - 392734");
		$display("Test XOR gate");
		$display("\n a ^ b = s\n");
		$monitor("%b ^ %b = %b", a, b, s);
		
	#1 a = 0; b = 0; // valores decimais
	#1 a = 4'b0010; b = 4'b0001; // valores binarios
	#1 a = 4'd1; b = 3; // decimal e decimal
	#1 a = 4'o5; b = 2; // octal e decimal
	#1 a = 4'hA; b = 3; // hexadecimal e decimal
	#1 a = 4'h9; b = 4'o3; // hexadecimal e octal
	
	end //-- end main

endmodule //-- end testxorgate