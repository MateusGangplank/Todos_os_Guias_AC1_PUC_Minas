// -------------------------
// Exercicio04
// Nome: Willian Antonio dos Santos
// Matricula: 462020
// -------------------------
// -------------------------
// Calculos - Exercicio04
// -------------------------
module exercicio_04;
   // ------------------------- definir dados
   reg [7:0] a;
   reg [2:0] b1;
   reg [2:0] b2;
   reg [2:0] b3;
   reg [6:0] b;
   reg [5:0] c;
   reg [4:0] d;
   reg [7:0] e;
   reg [7:0] r1;
   reg [6:0] r2;
   reg [5:0] r3;
   reg [4:0] r4;
   reg [7:0] r5;
   // ------------------------- parte principal
   initial begin
           $display("Exercicio04 - Willian Antonio dos Santos - 462020");
           $display("Calculos complemento de 2...");
           a = 8'b101011;
           r1 = ~a + 1;
           $display("\na) %8b(2) : %8b(2)",a,r1);
           b1 = 2'b01;
           b2 = 2'b10;
           b3 = 2'b11;
           b = (b3)*16 + (b2)*4 + (b1);
           r2 = ~b + 1;
           $display("\nb) %d%d%d(4) = %7b(2) : %7b(2)",b3,b2,b1,b,r2);
           c = 27;
           r3 = ~c + 1;
           $display("\nc) %d(10) = %6b(2) : %6b(2)",c,c,r3);
           d = 5'hc;
           r4 = ~d + 1;
           $display("\nd) %h(16) = %5b(2) : %5b(2)",d,d,r4);
           e = 8'o21;
           r5 = ~e + 1;
           $display("\ne) %2o(8) = %8b(2) : %8b(2)",e,e,r5);
   end
endmodule // exercicio