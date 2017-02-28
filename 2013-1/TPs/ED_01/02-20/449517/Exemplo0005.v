// ---------------------------------
// ------- Exemplo0005 - xor -------
// Ana Carolina Conceição de Jesus
// Matricula : 449517
// ---------------------------------

// ---------------------------------
// --------- XOr gate --------------
// ---------------------------------

module xorgate(output [0:3]s, input [0:3]p, input [0:3]q);
assign s = p ^ q;
endmodule // xorgate

// --------------------------------
// -------- Test xor gate ---------
// --------------------------------

module testxorgate;
// -------------- dados locais
reg [0:3]a,b; // definir registrador
			// (variavel independente)
wire [0:3]s; // definir conexao (fio)
			// (variavel dependente)

// ----------------------- instancia
xorgate XOR1(s,a,b);
// -------------------- preparação
initial begin:start
a =4'b0011; b =4'b0101; // atribuição simultanea
end

//----------- parte principal
initial begin:main
	$display("Exemplo0003 - Ana Carolina - 449517");
	$display("Test XOR gate");
	$display("\n a ^ b = s\n");
	$monitor("%b ^ %b = %b",a,b,s);
#1 a=0; b=0; // valores decimais 
#1 a=4'b0010; b=4'b0001; // valores binarios 
#1 a=4'd1; b=3; // decimal e decimal 
#1 a=4'o5; b=2; // octal e decimal 
#1 a=4'hA; b=3; // hexadecimal e decimal 
#1 a=4'h9; b=4'o3; // hexadecimal e octal 		

end

endmodule // testxorgate
