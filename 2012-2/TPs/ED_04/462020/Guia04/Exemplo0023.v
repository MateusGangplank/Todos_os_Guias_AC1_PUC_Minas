// -------------------------
// Exemplo0023 – Comparador Igualdade
// Nome: Willian Antonio dos Santos
// Matricula: 462020
// -------------------------
// -------------------------
// compI 3 bit
// -------------------------
module compI3b (output s, input [2:0] a, input [2:0] b);
       wire s1, s2, s3;
       xnor XN1(s1, a[0], b[0]);
       xnor XN2(s2, a[1], b[1]);
       xnor XN3(s3, a[2], b[2]);
       and A1(s, s1, s2, s3);
endmodule // compI3b
// Testes
module test_compI3b;
       // ------------------------- definir dados
       reg [2:0] x;
       reg [2:0] y;
       wire igual;
       compI3b CI31(igual, x, y);
       // ------------------------- parte principal
       initial begin
               $display("Exemplo0023 - Willian Antonio dos Santos - 462020");
               $display("Teste de ALU, comparador de Igualdade\n\nSaida vai a 1 se for igual, 0 se for diferente.\n");
               x = 0; y = 0;
               $monitor("Valor1: %3b = Valor2: %3b ? Igualdade : %b ", x, y, igual);
               repeat (7) begin
                      #1 y = y + 1;
               end
               #1 $display("-----------------------------------------");
               repeat (7) begin
                      #1 x = x + 1;y = y + 1;
                      repeat (7) begin
                             #1 y = y + 1;
                      end
                      #1 $display("-----------------------------------------");
               end
       end
endmodule // test_compI3b