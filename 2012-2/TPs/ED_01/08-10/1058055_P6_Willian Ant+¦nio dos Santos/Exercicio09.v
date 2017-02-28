// -------------------------
// Exercicio09 - AND4IN
// Nome: Willian Antonio dos Santos
// Matricula: 462020
// -------------------------
// -------------------------
// -- and gate 2IN
// -------------------------
module andgate (output s, input p, input q);
       assign s = (p & q);
endmodule // andgate
// -------------------------
// -- and gate 4IN
// -------------------------
module andgate4 (output s, input p, input q, input r, input t);
       wire s1, s2;
       andgate AND1 (s1, p, q);
       andgate AND2 (s2, r, t);
       andgate AND3 (s, s1, s2);
endmodule // andgate4
// -------------------------
// -- test and gate 4IN
// -------------------------
module testandgate;
        // ------------------------- dados locais
        reg a, b, c, d;    // definir registrador
        reg [3:0] count;
        wire s;      // definir conexao (fio)
        // ------------------------- instancia
        andgate4 AND4 (s, a, b, c, d);
        // ------------------------- preparacao
        initial begin:start
                     // valores iniciais
                a=0; b=0; c=0; d=0; count=0;
        end
        // ------------------------- parte principal
        initial begin:main
                     // execucao unitaria
                $display("Exercicio09 - Willian Antonio dos Santos - 462020");
                $display("Test AND gate 4IN:");
                $display("\n(a & b & c & d) = s\n");
                $monitor("(%b & %b & %b & %b) = %b", a, b, c, d, s);
                count = 0;
                repeat (15) begin
                       count <= count + 1;
                       #1 a<=count[3]; b<=count[2]; c<=count[1]; d<=count[0];
                end
        end
endmodule // testandgate