// -------------------------
// Exemplo0005 - XOR
// Nome: Willian Antonio dos Santos
// Matricula: 462020
// -------------------------
// -------------------------
// -- xor gate
// -------------------------
module xorgate (output s, input p, input q);
       assign s = p ^ q;
endmodule // xorgate
// -------------------------
// -- test xor gate
// -------------------------
module testxorgate;
        // ------------------------- dados locais
        reg a, b;    // definir registrador
        wire s;      // definir conexao (fio)
        // ------------------------- instancia
        xorgate XOR1 (s, a, b);
        // ------------------------- preparacao
        initial begin:start
                     // valores iniciais
                a=0; b=0;
        end
        // ------------------------- parte principal
        initial begin:main
                     // execucao unitaria
                $display("Exemplo0005 - Willian Antonio dos Santos - 462020");
                $display("Test XOR gate:");
                $display("\na ^ b = s\n");
                $monitor("%b ^ %b = %b", a, b, s);
             #1 a=0; b=0; // valores decimais
             #1 a=4'b0010; b=4'b0001; // valores binarios
             #1 a=4'd1; b=3; // decimal e decimal
             #1 a=4'o5; b=2; // octal e decimal
             #1 a=4'hA; b=3; // hexadecimal e decimal
             #1 a=4'h9; b=4'o3; // hexadecimal e octal
        end
endmodule // testxorgate