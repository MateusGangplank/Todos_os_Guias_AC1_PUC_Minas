//ARQ1 - Eduardo Botelho de Andrade - Guia02

module operations;

 reg [5:0] r1;
 reg [4:0] r2;
 reg [4:0] r3;
 reg [4:0] r4;
 reg [9:0] r5;
 reg [5:0] r6;
 reg [8:0] r7;
 reg [8:0] r8;
 reg [4:0] r9;
 reg [4:0] r10;
 reg [6:0] r11;

 reg [6:0] s1;
 reg [5:0] s2;
 reg [9:0] s3;
 reg [6:0] s4;
 reg [9:0] s5;

 initial
  begin
   r1 = 6'b101010;
   r2 = 5'b11010;
   s1 = r1+r2;

   r3 = 5'b11010;
   r4 = 5'o25;
   s2 = r3+r4;

   r5 = 10'o1234;
   r6 = 6'h2B;
   s3 = r5/r6;

   r7 = 9'h1CA;
   r8 = 9'b101110001;
   s4 = r7 + ((~r8)+1'b1);

   r9 = 5'o25;
   r10 = 5'o31;
   r11 = 7'h7A;
   s5 = r9*r10 + r11;
  end

  initial
   begin
    $display("Operações entre números de bases diferentes");
    $display("a = %d = %6b",r1,r1);
    $display("b = %d = %5b",r2,r2);
    $display("a + b = %d = %7b",s1,s1);
    $display("");
    $display("a = %d = %5b",r3,r3);
    $display("b = %d = %5o",r4,r4);
    $display("a + b = %3d = %7b",s2,s2);
    $display("");
    $display("a = %d = %10o",r5,r5);
    $display("b = %d = %6h",r6,r6);
    $display("a / b = %3d = %7b",s3,s3);
    $display("");
    $display("a = %d = %9h",r7,r7);
    $display("b = %d = %9b",r8,r8);
    $display("a - b = %3d = %7b",s4,s4);
    $display("");
    $display("a = %d = %6o",r9,r9);
    $display("b = %d = %5o",r10,r10);
    $display("c = %d = %7h",r11,r11);
    $display("a * b + c = %3d = %7b",s5,s5);
    $display("");
   end

endmodule