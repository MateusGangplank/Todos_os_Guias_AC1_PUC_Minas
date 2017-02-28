// ---------------------
// Exemplo 02_01 
// Nome: xxx yyy zzz
// Matricula: 999999
// ---------------------

// ----------------------
// -- test number system
// ----------------------

module test;
 reg [3:0] a;
 reg [0:3] b;
 
 reg [3:0] c;
 reg [0:3] d;
 
// parte principal
 initial begin:main
 a[0] = 1;
 a[1] = 1;
 a[2] = 0;
 a[3] = 1;

 b[0] = 1;
 b[1] = 1;
 b[2] = 0;
 b[3] = 1;

 c = 4'b1011;
 d = 4'b1101;
/*
 c = 11;
 d = 13;

 c = 13;
 d = 11;
*/

 $display ("Test format\n");
 $display ("base  2: a=%4b b=%b", a, b);
 $display ("base  8: a=%o  b=%o", a, b);
 $display ("base 16: a=%h  b=%h", a, b);
 $display ("base 10: a=%d  b=%d", a, b);
 $display ("\n");

 $display ("base  2: c=%4b d=%b", c, d);
 $display ("base  8: c=%o  d=%o", c, d);
 $display ("base 16: c=%h  d=%h", c, d);
 $display ("base 10: c=%d  d=%d", c, d);
 $display ("\n");

 end

endmodule // test
