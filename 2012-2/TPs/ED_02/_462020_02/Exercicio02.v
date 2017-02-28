// -------------------------
// Exercicio02
// Nome: Willian Antonio dos Santos
// Matricula: 462020
// -------------------------
// -------------------------
// Calculos - Exercicio02
// -------------------------
module exercicio_02;
   // ------------------------- definir dados
   reg [5:0] a;
   reg [4:0] b;
   reg [9:0] c;
   reg [8:0] d;
   reg [6:0] e;
   reg [6:0] r1;
   reg [5:0] r2;
   reg [3:0] r3;
   reg [9:0] r4;
   // ------------------------- parte principal
   initial begin
           $display("Exercicio02 - Willian Antonio dos Santos - 462020");
           $display("Calculos...");
           a = 6'b101010;
           b = 5'b11011;
           r1 = a + b;
           $display("\na) %5b(2) + %6b(2) = %7b(2)",a,b,r1);
           a = 5'o25;
           r2 = b + a;
           $display("\nb) %6b(2) + %2o(8) = %6b(2)",b,a,r2);
           c = 10'o1234;
           a = 6'h3c;
           r3 = c/a;
           $display("\nc) %4o(8) / %2h(16) = %4b(2)",c,a,r3);
           c = 9'h1ba;
           d = 9'b101110001;
           r1 = c-d;
           $display("\nd) %3h(16) - %9b(2) = %7b(2)",c,d,r1);
           b = 25;
           a = 5'o32;
           e = 7'h7a;
           r4 = b*a+e;
           $display("\ne) %d * %2o(8) + %2h(16) = %10b(2)",b,a,e,r4);
   end
endmodule // exercicio