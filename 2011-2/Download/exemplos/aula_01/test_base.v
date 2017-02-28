// ---------------------
// Exemplo 03_01 - BASE
// Nome: xxx yyy zzz
// Matricula: 999999
// ---------------------

// ---------------------
//  test number system
// ---------------------

module test_base;
 reg [2:0] a;
 reg [3:0] b;
 reg [4:0] c;
 reg [4:0] d;

// parte principal
 initial begin
      $display("Exemplo 03_01 - xxx yyy zzz - 999999");
      $display("Test number system");
      a =  5;
      b =  5;
      c =  5;
      $display("\nPositive value");
      $display("a = %d = %3b", a, a);
      $display("b = %d = %4b", b, b);
      $display("c = %d = %5b", c, c);
      a = -5;
      b = -5;
      c = -5;
      $display("\nNegative value");
      $display("a = %d = %3b", a, a);
      $display("b = %d = %4b", b, b);
      $display("c = %d = %5b", c, c);
      a = ~5+1;
      b = ~5+1;
      c = ~5+1;
      $display("\nNegative mixed expression");
      $display("a = %d = %3b", a, a);
      $display("b = %d = %4b", b, b);
      $display("c = %d = %5b", c, c);
      a = 5 + 3;
      b = 5 + 3;
      c = 10 - 5 + 25 + 3 + 1;
      $display("\nOverflow");
      $display("a = %d = %3b", a, a);
      $display("b = %d = %4b", b, b);
      $display("c = %d = %5b", c, c);
      
      $display("\nComplement");
      $display("0= %d = %3b = %3b",   ~1 , (1-1),   ~1 );
      $display("1= %d = %3b = %3b",   ~0 , (2-1),   ~0 );
      $display("2= %d = %3b = %3b", (1+1), (3-1), ~0+~0);
 end

endmodule // test_base
