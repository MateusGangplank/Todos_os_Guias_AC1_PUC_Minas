// -------------------------
// Exemplo0024 – Comparador Diferenca
// Nome: Willian Antonio dos Santos
// Matricula: 462020
// -------------------------
// -------------------------
// compD 3 bit
// -------------------------
module compD3b (output s, input [2:0] a, input [2:0] b);
       wire s1, s2, s3;
       xor X1(s1, a[0], b[0]);
       xor X2(s2, a[1], b[1]);
       xor X3(s3, a[2], b[2]);
       or O1(s, s1, s2, s3);
endmodule // compD3b
// Testes
module test_compD3b;
       // ------------------------- definir dados
       reg [2:0] x;
       reg [2:0] y;
       wire dif;
       compD3b CD31(dif, x, y);
       // ------------------------- parte principal
       initial begin
               $display("Exemplo0024 - Willian Antonio dos Santos - 462020");
               $display("Teste de ALU, comparador de diferenca\n\nSaida vai a 1 se for diferente, 0 se for igual.\n");
               x = 0; y = 0;
               $monitor("Valor1: %3b != Valor2: %3b ? Diferente : %b ", x, y, dif);
               repeat (7) begin
                      #1 y = y + 1;
               end
               #1 $display("------------------------------------------");
               repeat (7) begin
                      #1 x = x + 1;y = y + 1;
                      repeat (7) begin
                             #1 y = y + 1;
                      end
                      #1 $display("------------------------------------------");
               end
       end
endmodule // test_compD3b