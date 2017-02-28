// -------------------------
// Exercicio01
// Nome: Willian Antonio dos Santos
// Matricula: 462020
// -------------------------
// -------------------------
// Calculos - Exercicio01
// -------------------------
module exercicio_01;
   // ------------------------- definir dados
   reg [1:0] a;
   reg [3:0] b;
   reg [5:0] c;
   reg d;
   reg [4:0] r1;
   reg [2:0] r2;
   reg [3:0] r3;
   // ------------------------- parte principal
   initial begin
           $display("Exercicio01 - Willian Antonio dos Santos - 462020");
           $display("Calculos...");
           a = 2;
           b = 14;
           r1 = a + b;
           $display("\na) %d + %d = %5b",a,b,r1);
           a = 3;
           b = 9;
           r1 = a*b;
           $display("\nb) %d * %d = %5b",a,b,r1);
           c = 32;
           b = 5;
           r2 = c/b;
           $display("\nc) %d / %d = %3b",c,b,r2);
           c = 24;
           b = 11;
           r3 = c-b;
           $display("\nd) %d - %d = %4b",c,b,r3);
           a = 2;
           b = 6;
           c = 7;
           d = 1;
           r1 = a*b+c-d;
           $display("\ne) %d * %d + %d - %d = %5b",a,b,c,d,r1);
   end
endmodule // exercicio