// -------------------------
// Exercicio06
// Nome: Willian Antonio dos Santos
// Matricula: 462020
// -------------------------
// -------------------------
// comparador de igualdade
// -------------------------
module comp1 (output s, input [1:0] a, input [1:0] b);
       wire [1:0] s1;
       // portas logicas
       xor X1 (s1[0], a[0], b[0]);
       xor X2 (s1[1], a[1], b[1]);
       or O1 (s, s1[1], s1[0]);
endmodule // comp1

module test_comp1;
       // ------------------------- definir dados
       reg [1:0] x;
       reg [1:0] y;
       wire z;
       comp1 modulo (z, x, y);
       // ------------------------- parte principal
       initial begin
               $display("Exercicio06 - Willian Antonio dos Santos - 462020");
               $display("Teste do comparador");
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
endmodule // test_comp1