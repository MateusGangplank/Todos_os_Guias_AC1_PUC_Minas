// -------------------------
// Exercicio12 - ORbyte
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
// -- or gate byte
// -------------------------
module orgateByte (output s, input [7:0] p);
       wire s3, s4;
       orgate4 OR4 (s3, p[3], p[2], p[1], p[0]);
       orgate4 OR5 (s4, p[7], p[6], p[5], p[4]);
       orgate OR6 (s, s4, s3);
endmodule // orgatebyte
// -------------------------
// -- test or gate byte
// -------------------------
module testorgateByte;
        // ------------------------- dados locais
        reg [7:0] count;
        wire s;      // definir conexao (fio)
        // ------------------------- instancia
        orgateByte OR7 (s, count);
        // ------------------------- preparacao
        initial begin:start
                     // valores iniciais
                count=0;
        end
        // ------------------------- parte principal
        initial begin:main
                     // execucao unitaria
                $display("Exercicio12 - Willian Antonio dos Santos - 462020");
                $display("Test OR gate byte:");
                $display("\n(a | b | c | d | e | f | g | h) = s\n");
                $monitor("(%b | %b | %b | %b | %b | %b | %b | %b) = %b", count[7], count[6], count[5], count[4], count[3], count[2], count[1], count[0], s);
                count = 0;
                repeat (255) begin
                       #1 count <= count + 1;
                end
        end
endmodule // testorgateByte