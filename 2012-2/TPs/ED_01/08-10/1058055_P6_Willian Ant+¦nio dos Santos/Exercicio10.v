// -------------------------
// Exercicio10 - OR4IN
// Nome: Willian Antonio dos Santos
// Matricula: 462020
// -------------------------
// -------------------------
// -- or gate 2IN
// -------------------------
module orgate (output s, input p, input q);
       assign s = (p | q);
endmodule // orgate
// -------------------------
// -- or gate 4IN
// -------------------------
module orgate4 (output s, input p, input q, input r, input t);
       wire s1, s2;
       orgate OR1 (s1, p, q);
       orgate OR2 (s2, r, t);
       orgate OR3 (s, s1, s2);
endmodule // orgate4
// -------------------------
// -- test or gate 4IN
// -------------------------
module testorgate;
        // ------------------------- dados locais
        reg a, b, c, d;    // definir registrador
        reg [3:0] count;
        wire s;      // definir conexao (fio)
        // ------------------------- instancia
        orgate4 OR4 (s, a, b, c, d);
        // ------------------------- preparacao
        initial begin:start
                     // valores iniciais
                a=0; b=0; c=0; d=0; count=0;
        end
        // ------------------------- parte principal
        initial begin:main
                     // execucao unitaria
                $display("Exercicio10 - Willian Antonio dos Santos - 462020");
                $display("Test OR gate 4IN:");
                $display("\n(a | b | c | d) = s\n");
                $monitor("(%b | %b | %b | %b) = %b", a, b, c, d, s);
                count = 0;
                repeat (15) begin
                       count <= count + 1;
                       #1 a<=count[3]; b<=count[2]; c<=count[1]; d<=count[0];
                end
        end
endmodule // testorgate