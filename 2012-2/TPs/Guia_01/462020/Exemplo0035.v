// -------------------------
// Exemplo0035 - lu4
// Nome: Willian Antonio dos Santos
// Matricula: 462020
// -------------------------
// -------------------------
// unidade logica 4 ( lu4 )
// -------------------------
module lu4 (output s, input a, input b, input [2:0] selecao);
       wire [7:0] s1;
       // Portas Principais da LU
       not N2 (s1[0], a);
       and A1 (s1[1], a, b);
       or O1 (s1[2], a, b);
       xor X1 (s1[3], a, b);
       not N1 (s1[4], b);
       nand NA1 (s1[5], a, b);
       nor NO1 (s1[6], a, b);
       xnor XN1 (s1[7], a, b);
       // Mux's
       mux3b M3x1 (s, s1, selecao);
endmodule // lu4

module mux3b (output s, input [7:0] a, input [2:0] selecao);
       wire [3:0] s2;
       wire [1:0] s3;
       mux Mx1 (s2[0],a[1],a[0],selecao[0]);
       mux Mx2 (s2[1],a[3],a[2],selecao[0]);
       mux Mx3 (s2[2],a[5],a[4],selecao[0]);
       mux Mx4 (s2[3],a[7],a[6],selecao[0]);
       mux Mx5 (s3[0],s2[1],s2[0],selecao[1]);
       mux Mx6 (s3[1],s2[3],s2[2],selecao[1]);
       mux Mx7 (s,s3[1],s3[0],selecao[2]);
endmodule // mux3b

module mux (output s, input a, input b, input selecao);
       wire selecao2,s7,s8;
       not N1 ( selecao2, selecao);
       and A2 ( s7, a, selecao);
       and A3 ( s8, b, selecao2);
       or O2 ( s, s7, s8);
endmodule // mux

module test_lu4;
       // ------------------------- definir dados
       reg x;
       reg y;
       reg [2:0] select;
       wire z;
       lu4 modulo (z, x, y, select);
       // ------------------------- parte principal
       initial begin
               $display("Exemplo0035 - Willian Antonio dos Santos - 462020");
               $display("Test lu4 module");
               x = 0; y = 0;select = 0;
               $monitor("Entradas: %b %b | Selecao: %2b => Saidas: %b",x,y,select,z);
               #1 x = 0; y = 1;
               #1 x = 1; y = 0;
               #1 x = 1; y = 1;
               #1 $display("-----------------------------------------");
               repeat (7) begin
                  #1 x = 0; y = 0; select = select + 1;
                  #1 x = 0; y = 1;
                  #1 x = 1; y = 0;
                  #1 x = 1; y = 1;
                  #1 $display("-----------------------------------------");
               end
       end
endmodule // test_lu4