//ARQ1 - Eduardo Botelho de Andrade - Guia02

module complements;

 reg [5:0] r1 = 6'b101010;
 reg [4:0] r2 = 5'b11011;
 reg [4:0] r3 = 5'b10111;
 reg [3:0] r4 = 4'b1110;
 reg [4:0] r5 = 5'b10110;
 
 //registradores para armazenar os complementos
   reg [7:0] a1;
   reg [6:0] a2;
   reg [5:0] a3;
   reg [4:0] a4;
   reg [7:0] a5;

 initial begin
   a1 = ~r1 + 1'b1;
   a2 = ~r2 + 1'b1;
   a3 = ~r3 + 1'b1;
   a4 = ~r4 + 1'b1;
   a5 = ~r5 + 1'b1;
 end
 
 initial begin
   $display("Complementos de dois");
   $display("r1 = %b",r1);
   $display("C(r1) = %b",a1);
   $display("");

   $display("r1 = 123(4) = %b",r1);
   $display("C(r2) = %b",a2);
   $display("");

   $display("r3 = 23(10) = %b",r1);
   $display("C(r3) = %b",a3);
   $display("");

   $display("r4 = E(16) = %b",r1);
   $display("C(r4) = %b",a4);
   $display("");

   $display("r5 = 26(8) = %b",r1);
   $display("C(r5) = %b",a5);
   $display("");

 end

endmodule