// ---------------------
// Exemplo 05_03 - xor
// Nome: xxx yyy zzz
// Matricula: 999999
// ---------------------

// ---------------------
// -- xor gate
// ---------------------

module xorgate (s, p, q);
 output s;
 input  p, q;
 wire   temp1, temp2;

 and AND1 ( temp1, ~p ,  q );
 and AND2 ( temp2,  p , ~q );

 assign s = temp1 | temp2;

endmodule // xor

// ---------------------
// -- test xorgate
// ---------------------

module testxorgate;
 reg   a, b;
 wire  s;
          // instancia
 xorgate XOR1 (s, a, b);

 initial begin:start
      a=0; b=0;
 end

          // parte principal
 initial begin:main
      $display("Exemplo 05_03 - xxx yyy zzz - 999999");
      $display("Test xor gate");
      $display("\na ^ b = s\n");
      $monitor("%b ^ %b = %b", a, b, s);
  #1  a=0; b=1;
  #1  a=1; b=0;
  #1  a=1; b=1;

 end

endmodule // testxorgate