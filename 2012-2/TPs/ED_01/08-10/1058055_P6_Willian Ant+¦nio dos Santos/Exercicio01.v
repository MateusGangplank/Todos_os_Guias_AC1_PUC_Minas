// -------------------------
// Exercicio01 - NAND
// Nome: Willian Antonio dos Santos
// Matricula: 462020
// -------------------------
// -------------------------
// -- nand gate
// -------------------------
module nandgate (output s, input p, input q);
       assign s = (~(p & q));
endmodule // nandgate
// -------------------------
// -- test nand gate
// -------------------------
module testnandgate;
        // ------------------------- dados locais
        reg a, b;    // definir registrador
        wire s;      // definir conexao (fio)
        // ------------------------- instancia
        nandgate NAND1 (s, a, b);
        // ------------------------- preparacao
        initial begin:start
                     // valores iniciais
                a=0; b=0;
        end
        // ------------------------- parte principal
        initial begin:main
                     // execucao unitaria
                $display("Exercicio01 - Willian Antonio dos Santos - 462020");
                $display("Test NAND gate:");
                $display("\n~(a & b) = s\n");
                a=0; b=0;
             #1 $display("~(%b & %b) = %b", a, b, s);
                a=0; b=1;
             #1 $display("~(%b & %b) = %b", a, b, s);
                a=1; b=0;
             #1 $display("~(%b & %b) = %b", a, b, s);
                a=1; b=1;
             #1 $display("~(%b & %b) = %b", a, b, s);
        end
endmodule // testnandgate