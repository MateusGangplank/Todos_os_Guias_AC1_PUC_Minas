// -------------------------
// Exercicio05
// Nome: Willian Antonio dos Santos
// Matricula: 462020
// -------------------------
// -------------------------
// Calculos - Exercicio05
// -------------------------
module exercicio_05;
   // ------------------------- definir dados
   reg [7:0] a1;
   reg [7:0] a2;
   reg [7:0] a22;
   reg [7:0] b1;
   reg [7:0] b2;
   reg [7:0] b22;
   reg [7:0] c1;
   reg [7:0] c2;
   reg [7:0] c22;
   reg [7:0] d1;
   reg [7:0] d2;
   reg [7:0] d22;
   reg [7:0] e1;
   reg [7:0] e2;
   reg [7:0] e22;
   reg [7:0] r1;
   reg [7:0] r2;
   reg [7:0] r3;
   reg [7:0] r4;
   reg [7:0] r5;
   // ------------------------- parte principal
   initial begin
           $display("Exercicio05 - Willian Antonio dos Santos - 462020");
           $display("Calcular e usar complemento de 2...");
           a1 = 8'b101010;
           a2 = 8'b1001;
           a22 = (~a2 + 1);
           r1 = a1 + a22;
           $display("\na) %8b(2) - %8b(2) = %8b(2) + %8b(2) = %8b(2)",a1,a2,a1,a22,r1);
           b1 = 8'b11011;
           b2 = 8'o15;
           b22 = (~b2 + 1);
           r2 = b1 + b22;
           $display("\nb) %8b(2) - %2o(8) = %8b(2) + %8b(2) = %8b(2)",b1,b2,b1,b22,r2);
           c1 = 8'o34;
           c2 = 8'hc;
           c22 = (~c2 + 1);
           r3 = c1 + c22;
           $display("\nc) %2o(8) - %h(16) = %8b(2) + %8b(2) = %8b(2)",c1,c2,c1,c22,r3);
           d1 = 8'hda;
           d2 = 8'b10111001;
           d22 = (~d2 + 1);
           r4 = d1 + d22;
           $display("\nd) %2h(16) - %8b(2) = %8b(2) + %8b(2) = %8b(2)",d1,d2,d1,d22,r4);
           e1 = 27;
           e2 = 8'h1b;
           e22 = (~e2 + 1);
           r5 = e1 + e22;
           $display("\ne) %d - %2h(16) = %8b(2) + %8b(2) = %8b(2)",e1,e2,e1,e22,r5);
   end
endmodule // exercicio