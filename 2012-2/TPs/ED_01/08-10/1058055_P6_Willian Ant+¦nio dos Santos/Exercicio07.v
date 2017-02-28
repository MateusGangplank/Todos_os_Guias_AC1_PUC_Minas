// -------------------------
// Exercicio07 - XNOR
// Nome: Willian Antonio dos Santos
// Matricula: 462020
// -------------------------
// -------------------------
// -- xnor gate
// -------------------------
module xnorgate (output s, input p, input q);
       assign s = ((p&q)|((~p)&(~q)));
endmodule // xnorgate
// -------------------------
// -- test xnor gate
// -------------------------
module testxnorgate;
        // ------------------------- dados locais
        reg a, b;    // definir registrador
        wire s;      // definir conexao (fio)
        // ------------------------- instancia
        xnorgate XNOR1 (s, a, b);
        // ------------------------- preparacao
        initial begin:start
                     // valores iniciais
                a=0; b=0;
        end
        // ------------------------- parte principal
        initial begin:main
                     // execucao unitaria
                $display("Exercicio07 - Willian Antonio dos Santos - 462020");
                $display("Test XNOR gate:");
                $display("\n~(a ^ b) = s\n");
                $monitor("~(%b ^ %b) = %b", a, b, s);
             #1 a=0; b=0;
             #1 a=0; b=1;
             #1 a=1; b=0;
             #1 a=1; b=1;
        end
endmodule // testxnorgate