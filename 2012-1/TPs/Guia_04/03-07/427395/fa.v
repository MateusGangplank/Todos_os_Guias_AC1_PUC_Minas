//Módulo para Soma Completa (Full Adder) - Eduardo Botelho de Andrade

module fa (output s, output carryout, input a, input b, input carryin);

and and1 (w1,a,b);
xor xor1 (w2,a,b);
and and2 (w3,carryin,w2);
xor xor2 (s,carryin,w2);
or or1 (carryout,w1,w3);

endmodule