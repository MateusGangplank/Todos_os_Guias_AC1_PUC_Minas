// ---------------------
// Exemplo 05_08 - xor
// Nome: xxx yyy zzz
// Matricula: 999999
// ---------------------

// ---------------------
// -- xor gate
// ---------------------

module xorgate (s, p);
 output s;
 input  [0:1] p;
 wire   [0:3] temp;

 not NOT1 ( temp[2], p[0] );
 not NOT2 ( temp[3], p[1] );
 and AND1 ( temp[0], temp[2], p[1]  );
 and AND2 ( temp[1], p[0] , temp[3] );

 or  OR1  (     s, temp[0], temp[1] );

endmodule // xor

// ---------------------
// -- test xorgate
// ---------------------

module testxorgate;
 reg   [0:1] a;
 wire  s;
          // instancia
 xorgate XOR1 (s, a);

 initial begin:start
      a[0]=0; a[1]=0;
 end

          // parte principal
 initial begin:main
      $display("Exemplo 05_08 - xxx yyy zzz - 999999");
      $display("Test xor gate");
      $display("\na ^ b = s\n");
      $monitor("%b ^%b = %b", a[0], a[1], s);
  #1  a[0]=0; a[1]=1;
  #1  a[0]=1; a[1]=0;
  #1  a[0]=1; a[1]=1;

 end

endmodule // testxorgate