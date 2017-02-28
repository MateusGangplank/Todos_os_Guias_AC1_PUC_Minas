// -------------------------
// Exemplo0005 - XOR
// Nome: Pedro Henrique Alves M. de Carvalho
// Matricula: 427452
// -------------------------

// -------------------------
// -- xor gate
// -------------------------
module xorgate (output [0:3]s, input [0:3]p, input [0:3]q);
 assign s = p ^ q;
endmodule // fim do xorgate

// -------------------------
// -- test xor gate
// -------------------------
module testxorgate;
// ------------------------- dados locais
	reg [0:3]a, b;	// definir registrador
	wire [0:3]s;	// definir conexao (fio)
// ------------------------- instancia
 xorgate XOR1 (s, a, b);
// ------------------------- preparacao
 initial begin:start
	a=4'b0011;	// 4 valores binaris
	b=4'b0101;	// 4 valores binaris
 end
 
// ------------------------- parte principal
 initial begin:main
	$display("Exemplo 0005 - Pedro Henrique A. M. de Carvalho - 427452");
	$display("Test XOR gate");
	$display("\na ^ b = s\n");
 
 #1 a=0; b=0;			// Valor decimais
 #1 $display("%b ^ %b = %b", a, b, s);
 #1 a=4'b0010; b=4'b0001;	//valores binarios
 #1 $display("%b ^ %b = %b", a, b, s);
 #1 a=4'd1; b=3;		//decimal e decimal
 #1 $display("%b ^ %b = %b", a, b, s);
 #1 a=4'o5; b=2;		//octal e  decial
 #1 $display("%b ^ %b = %b", a, b, s);
 #1 a=4'hA; b=3;		//hexadecimal e decimal
 #1 $display("%b ^ %b = %b", a, b, s);
 #1 a=4'h9; b=4'o3;	//hexadecimal e octal
 #1 $display("%b ^ %b = %b", a, b, s);
 end

endmodule // testorgate