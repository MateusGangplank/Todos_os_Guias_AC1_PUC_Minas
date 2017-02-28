// -------------------------
// Exercicio05 - NOR
// Nome: Willian Antonio dos Santos
// Matricula: 462020
// -------------------------
// -------------------------
// -- nor gate
// -------------------------
module norgate (output s, input p, input q);
       assign s = ((~p) & (~q)); // de morgan
endmodule // norgate
// -------------------------
// -- test nor gate
// -------------------------
module testnorgate;
        // ------------------------- dados locais
        reg a, b;    // definir registrador
        wire s;      // definir conexao (fio)
        // ------------------------- instancia
        norgate NOR1 (s, a, b);
        // ------------------------- preparacao
        initial begin:start
                     // valores iniciais
                a=0; b=0;
        end
        // ------------------------- parte principal
        initial begin:main
                     // execucao unitaria
                $display("Exercicio05 - Willian Antonio dos Santos - 462020");
                $display("Test NOR gate:");
                $display("\n~(a | b) = s\n");
                $monitor("~(%b | %b) = %b", a, b, s);
             #1 a=0; b=0;
             #1 a=0; b=1;
             #1 a=1; b=0;
             #1 a=1; b=1;
        end
endmodule // testnorgate