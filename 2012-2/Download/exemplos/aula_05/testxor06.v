// ---------------------
// Exemplo 05_06 - xor
// Nome: xxx yyy zzz
// Matricula: 999999
// ---------------------

// ---------------------
// -- xor gate
// ---------------------

module xorgate (s, p, q);
 output s;
 input  p, q;
 wire   temp1, temp2, 
        temp3, temp4;

 not NOT1 ( temp3, p );
 not NOT2 ( temp4, q );
 and AND1 ( temp1, temp3,   q   );
 and AND2 ( temp2,   p  , temp4 );
 or  OR1  (     s, temp1, temp2 );

endmodule // xor

// ---------------------
// -- test xorgate
// ---------------------

module testxorgate;
 reg   [0:1] a;
 wire  s;
          // instancia
 xorgate XOR1 (s, a[0], a[1]);

 initial begin:start
      a[0]=0; a[1]=0;
 end

          // parte principal
 initial begin:main
      $display("Exemplo 05_06 - xxx yyy zzz - 999999");
      $display("Test xor gate");
      $display("\na ^ b = s\n");
      $monitor("%b ^ %b = %b", a[0], a[1], s);
  #1  a[0]=0; a[1]=1;
  #1  a[0]=1; a[1]=0;
  #1  a[0]=1; a[1]=1;

 end

endmodule // testxorgate