// ---------------------
// Exemplo 05_09 - xor
// Nome: xxx yyy zzz
// Matricula: 999999
// ---------------------

// ---------------------
// -- xor gate
// ---------------------

module xorgate (s, p);
 output s;
 input  [0:1] p;
 wire   temp1, temp2, 
        temp3, temp4;

 not NOT1 ( temp3, p[0] );
 not NOT2 ( temp4, p[1] );
 and AND1 ( temp1, temp3, p[1]  );
 and AND2 ( temp2, p[0] , temp4 );

 or  OR1  (     s, temp1, temp2 );

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
      a=2'b00;
 end

          // parte principal
 initial begin:main
      $display("Exemplo 05_09 - xxx yyy zzz - 999999");
      $display("Test xor gate");
      $display("\na ^ b = s\n");
      $monitor("%b ^ %b = %b", a[0], a[1], s);
  #1  a=2'b01;
  #1  a=2'b10;
  #1  a=2'b11;

 end

endmodule // testxorgate