//Módulo para Subtração Completa (Full Subtractor) - Eduardo Botelho de Andrade

module fs (output s, output carryout, input a, input b, input carryin);

  not not1 (w1,a);
  and and1 (w2,w1,carryin);
  and and2 (w3,w1,b);
  and and3 (w4,b,carryin);
  xor xor1 (w5,a,b);
  xor xor2 (s,w5,carryin);
  or or1 (carryout,w2,w3,w4);

endmodule