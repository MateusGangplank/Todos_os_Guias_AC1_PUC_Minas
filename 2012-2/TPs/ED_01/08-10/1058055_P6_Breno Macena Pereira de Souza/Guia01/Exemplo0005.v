// -------------------------
// Exemplo0005 - XOR
// Nome: Breno Macena Pereira de Souza
// Matricula: 462017
// -------------------------

// -------------------------
// -- xor gate
// -------------------------
module xorgate (output [0:3]s, input [0:3]p, input [0:3]q);
assign s = p ^ q; // criar vínculo permanente
              // (dependência)
endmodule // xorgate

// -------------------------
// -- test xor gate
// -------------------------
module testxorgate;
// ------------------------- dados locais
reg [0:3]a, b;   // definir registrador
                 // (variável independente)
wire [0:3]s;  // definir conexao (fio)
         // (variável dependente)
// ------------------------- instância
xorgate XOR1 (s, a, b);
// ------------------------- preparação
initial begin:start
          // atribuição simultânea dos valores iniciais
a=4'b0011;  // 4 valores binários 
b=4'b0101;	// 4 valores binários		 
end

// ------------------------- parte principal
initial begin:main
     $display("Exemplo 0005 - Breno Macena - 462017");
     $display("Test XOR gate:");
     $display("\na ^ b = s\n");
	  $monitor("%b ^ %b = %b", a, b, s);
#1 a=0; b=0;              // valores decimais
#1 a=4'b0010; b=4'b0001;  // valores binários
#1 a=4'd1;    b=3;        // decimal e decimal
#1 a=4'o5;    b=2;        // octal e decimal
#1 a=4'hA;    b=3;        // hexadecimal e decimal
#1 a=4'h9;    b=4'o3;     // hexadecimal e octal
end
endmodule // testorgate












