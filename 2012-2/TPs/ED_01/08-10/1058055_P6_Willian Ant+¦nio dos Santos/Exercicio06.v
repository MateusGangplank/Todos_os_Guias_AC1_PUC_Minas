// -------------------------
// Exercicio06 - XOR
// Nome: Willian Antonio dos Santos
// Matricula: 462020
// -------------------------
// -------------------------
// -- xor gate
// -------------------------
module xorgate (output s, input p, input q);
       assign s = (((~p)&q) | ((~q)&p));
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
                $display("Exercicio06 - Willian Antonio dos Santos - 462020");
                $display("Test XOR gate:");
                $display("\na ^ b = s\n");
                $monitor("%b ^ %b = %b", a, b, s);
             #1 a=0; b=0;
             #1 a=0; b=1;
             #1 a=1; b=0;
             #1 a=1; b=1;
        end
endmodule // testxorgate