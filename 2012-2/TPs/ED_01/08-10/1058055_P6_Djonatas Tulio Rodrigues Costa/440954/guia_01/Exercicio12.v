// -------------------------
// Exercicio12 - (receber um byte e retornar 1, se algum de seus bits for igual a 1)
// Nome: Djonatas Tulio Rodrigues Costa
// Matricula: 440954
// -------------------------

// -------------------------
// -- or gate
// -------------------------
module orgate (output s, input [7:0]a);
	assign s = (a[0] | a[1] | a[2] | a[3] | a[4] | a[5] | a[6] | a[7]);
endmodule // orgate

// -------------------------
// -- test or gate
// -------------------------
module testorgate;
	reg [7:0]a;	// definir registrador
			// (variavel independente)
	wire s;		// definir conexao (fio)
			// (variavel dependente)
// ------------------------- instancia
	orgate OR1 (s, a);
// ------------------------- preparacao
	initial begin:start
		a=8'b00000000;
	end
// ------------------------- parte principal
	initial begin:main
		$display("Exercicio12 - Djonatas Tulio Rodrigues Costa - 440954");
		$display("Test OR gate");
		$display("\nbyte     = s\n");
		$monitor("%b = %b", a, s);
	#1 a=8'b00000001;
	#1 a=8'b00000010;
	#1 a=8'b00000100;
	#1 a=8'b00001000;
	#1 a=8'b00010000;
	#1 a=8'b00100000;
	#1 a=8'b01000000;
	#1 a=8'b10000000;
	#1 a=8'b11111111;
	end

endmodule // orgate
