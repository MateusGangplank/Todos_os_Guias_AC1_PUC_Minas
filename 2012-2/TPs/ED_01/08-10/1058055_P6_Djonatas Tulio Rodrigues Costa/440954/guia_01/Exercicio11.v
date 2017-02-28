// -------------------------
// Exercicio11 - (receber um byte e retornar 1, se todos os seus bits forem iguais a 0)
// Nome: Djonatas Tulio Rodrigues Costa
// Matricula: 440954
// -------------------------

// -------------------------
// -- nor gate
// -------------------------
module norgate (output s, input [7:0]a);
	assign s = ~(a[0] | a[1] | a[2] | a[3] | a[4] | a[5] | a[6] | a[7]);
endmodule // norgate

// -------------------------
// -- test nor gate
// -------------------------
module testnorgate;
	reg [7:0]a;	// definir registrador
			// (variavel independente)
	wire s;		// definir conexao (fio)
			// (variavel dependente)
// ------------------------- instancia
	norgate NOR1 (s, a);
// ------------------------- preparacao
	initial begin:start
		a=8'b00000000;
	end
// ------------------------- parte principal
	initial begin:main
		$display("Exercicio11 - Djonatas Tulio Rodrigues Costa - 440954");
		$display("Test NOR gate");
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

endmodule // norgate
