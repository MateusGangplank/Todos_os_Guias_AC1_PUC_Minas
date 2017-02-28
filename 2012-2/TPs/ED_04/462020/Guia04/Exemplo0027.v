// -------------------------
// Exemplo0027Extra – comparador de igualdade ou diferenca
// Nome: Willian Antonio dos Santos
// Matricula: 462020
// -------------------------
// -------------------------
// comparador de diferenca e igualdade selecionavel ( 0 - igualdade | 2 - diferenca )
// -------------------------
module compIeD3b (output s, input [2:0] a, input [2:0] b, input chave);
       wire s1, s2, s3, s4, s5;
       xor X1(s1, a[0], b[0]);
       xor X2(s2, a[1], b[1]);
       xor X3(s3, a[2], b[2]);
       or O1(s4, s1, s2, s3);
       not N1(s5, s4); // faz a negacao da saida do comparador de desigualdade para selecionar igualdade.
       mux M1(s, s5, s4, chave);
endmodule // compIeD3b
// -------------------------
// mux para selecao de 2 entradas de 1 bit para uma saida de 1 bit
// -------------------------
module mux (output s, input a, input b, input selecao);
       wire selecaoN,s6,s7;
       not N2 ( selecaoN, selecao);
       and A2 ( s6, a, selecaoN);
       and A3 ( s7, b, selecao);
       or O2 ( s, s6, s7);
endmodule // mux
// Testes
module test_compIeD3b;
       // ------------------------- definir dados
       reg [2:0] x;
       reg [2:0] y;
       reg select;
       wire result;
       compIeD3b CID31(result, x, y, select);
       // ------------------------- parte principal
       initial begin
               $display("Exemplo0027Extra - Willian Antonio dos Santos - 462020");
               $display("Test ALU's - Comparador de igualdade ou diferenca selecionavel");
               $display("\nO bit de selecao em 0 e' igualdade, em 1 e' diferenca.\n");
               x = 0; y = 0; select = 0;
               $monitor("Valor1: %3b | Valor2: %3b | igualdade ou dif ? : %b | = %b", x, y, select, result);
               repeat (7) begin
                      #1 y = y + 1;
               end
               #1 $display("--------------------------------------------------------");
               repeat (7) begin
                      #1 x = x + 1;y = y + 1;
                      repeat (7) begin
                             #1 y = y + 1;
                      end
                      #1 $display("--------------------------------------------------------");
               end
               #1 x = 0; y = 0; select = 1;
               repeat (7) begin
                      #1 y = y + 1;
               end
               #1 $display("--------------------------------------------------------");
               repeat (7) begin
                      #1 x = x + 1;y = y + 1;
                      repeat (7) begin
                             #1 y = y + 1;
                      end
                      #1 $display("--------------------------------------------------------");
               end
       end
endmodule // test_compIeD3b