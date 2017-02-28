// -------------------------
// Exercicio03
// Nome: Willian Antonio dos Santos
// Matricula: 462020
// -------------------------
// -------------------------
// Calculos - Exercicio03
// -------------------------
module exercicio_03;
   // ------------------------- definir dados
   reg [5:0] a;
   reg [4:0] b;
   reg [6:0] c;
   reg [6:0] d;
   reg [5:0] r1;
   reg [4:0] r2;
   reg [6:0] r3;
   reg [6:0] r4;
   reg [6:0] r5;
   // ------------------------- parte principal
   initial begin
           $display("Exercicio03 - Willian Antonio dos Santos - 462020");
           $display("Calculos complemento de 2...");
           a = 6'b100110;
           r1 = ~a + 1;
           $display("\na) %6b(2) : %6b(2)",a,r1);
           b = 5'o24;
           r2 = ~b + 1;
           $display("\nb) %2o(8) = %5b(2) : %5b(2)",b,b,r2);
           b = 25;
           r2 = ~b + 1;
           $display("\nc) %d(10) = %5b(2) : %5b(2)",b,b,r2);
           a = 6'h2d;
           r1 = ~a + 1;
           $display("\nd) %2h(16) = %6b(2) : %6b(2)",a,a,r1);
           c = 27;
           d = 37;
           r3 = ~d + 1;
           r4 = c + r3;
           r5 = ~r4 + 1;
           $display("\ne) %d(10) - %d(10) = %7b(2) - %7b(2) \n  = %7b(2) + %7b(2) = %7b(2) : %7b(2)",c,d,c,d,c,r3,r4,r5);
   end
endmodule // exercicio