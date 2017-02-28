// -------------------------
// Exemplo0032 - lu
// Nome: Willian Antonio dos Santos
// Matricula: 462020
// -------------------------
// -------------------------
// unidade logica ( lu )
// -------------------------
module lu (output s, input a, input b, input selecao);
       wire s1,s2;
       // Portas Principais da LU
       and A1 ( s1, a, b);
       or O1 ( s2, a, b);
       // Mux
       mux Mx1 (s,s1,s2,selecao);
endmodule // lu

module mux (output s, input a, input b, input selecao);
       wire selecao2,s3,s4;
       not N1 ( selecao2, selecao);
       and A2 ( s3, a, selecao);
       and A3 ( s4, b, selecao2);
       or O2 ( s, s3, s4);
endmodule // lu

module test_lu;
       // ------------------------- definir dados
       reg x;
       reg y;
       reg select;
       wire z;
       lu modulo (z, x, y, select);
       // ------------------------- parte principal
       initial begin
               $display("Exemplo0032 - Willian Antonio dos Santos - 462020");
               $display("Test LU's module");
               x = 0; y = 0;select = 0;
               $monitor("Entradas: %b %b | Selecao: %b => Saida: %b",x,y,select,z);
               #1 x = 0; y = 1;select = 0;
               #1 x = 1; y = 0;select = 0;
               #1 x = 1; y = 1;select = 0;
               #1 $display("--------------------------------------");
               #1 x = 0; y = 0;select = 1;
               #1 x = 0; y = 1;select = 1;
               #1 x = 1; y = 0;select = 1;
               #1 x = 1; y = 1;select = 1;
               #1 $display("--------------------------------------");
       end
endmodule // test_lu