// -------------------------
// Exercicio07
// Nome: Willian Antonio dos Santos
// Matricula: 462020
// -------------------------
// -------------------------
// comparador de maior ou igual
// -------------------------
module comp2 (output s, input [1:0] a, input [1:0] b);
       wire [1:0] s1;
       wire [1:0] s2;
       wire [1:0] s3;
       wire s4;
       wire [1:0] s5;
       // Portas logicas
       // Complemento de 1 e soma 1 ja inserido para fazer a subtracao 3 bits de a - b
       // O ultimo bit e' o sinal e consequentemente indica qual numero e' maior ou se os dois sao iguais.
       not N1 (s1[0],b[0]);
       not N2 (s1[1],b[1]);
       xor X1 (s2[0], s1[0], s1[1]);
       nand NA1 (s2[1], s1[0], s1[1]);
       xor X2 (s3[0], s2[0], a[1]);
       and A1 (s3[1], s2[0], a[1]);
       and A2 (s4, b[0], a[0]);
       and A3 (s5[0], s4, s3[0]);
       xor X3 (s5[1], s3[1], s2[1]);
       xnor XN1 (s, s5[1], s5[0]);
endmodule // comp2

module test_comp2;
       // ------------------------- definir dados
       reg [1:0] x;
       reg [1:0] y;
       wire z;
       comp2 modulo (z, x, y);
       // ------------------------- parte principal
       initial begin
               $display("Exercicio07 - Willian Antonio dos Santos - 462020");
               $display("Teste do comparador, maior ou igual (1)");
               x = 0; y = 0;
               $monitor("Entradas: %2b %2b => Saidas: %b",x,y,z);
               repeat (3) begin
                      #1 y = y + 1;
               end
               #1 $display("----------------------------");
               repeat (3) begin
                      #1 x = x + 1;y = y + 1;
                      repeat (3) begin
                             #1 y = y + 1;
                      end
                      #1 $display("----------------------------");
               end
       end
endmodule // test_comp2