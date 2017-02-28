module andf (output s, input a, input b, input c, input d);
  wire w1,w2,w3,w4,w5,w6;
  
  and (w1,a[3],b[3]);
  and (w2,a[2],b[2]);
  and (w3,a[1],b[1]);
  and (w4,a[0],b[0]);
  and (w5,w1,w2);
  and (w6,w3,w4);
  and (s,w5,w6);
  
endmodule

module ore (output s, input [3:0]


module alu (output s, input a, input b, input [2:0] chave);
  reg a;
  reg b;
  reg [2:0] chave; //chave do multiplexador, com 3 bits
  wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,
  w14,w15,w16,w17,w18,w19,w20,w21,w22,w23,w24,w25,
  w26,w27,w28;
  
  and   and1 (w1,a,b);
  or     or1 (w2,a,b);
  nand nand1 (w3,a,b);
  nor   nor1 (w4,a,b);
  xor   xor1 (w5,a,b);
  xnor xnor1 (w6,a,b);
  not   not1 (w7,a); //not de a
  not   not2 (w8,b); //not de b

  not   not3 (w9,chave[2]);
  not   not4 (w10,chave[1]);
  not   not5 (w11,chave[0]); //nots para and
  not   not6 (w12,chave[2]);
  not   not7 (w13,chave[1]); //nots para or
  not   not8 (w14,chave[2]);
  not   not9 (w15,chave[0]); //nots para nand
  not  not10 (w16,chave[2]); //not para nor
  not  not11 (w17,chave[1]);
  not  not12 (w18,chave[0]); //nots para xor
  not  not13 (w19,chave[1]); //not para xnor
  not  not14 (w20,chave[0]); //not para not(a)

  andf  and2 (w21,w1,w9,w10,w11);
  andf  and3 (w22,w2,w12,w13,chave[0]);
  andf  and4 (w23,w3,w14,w15,chave[1]);
  andf  and5 (w24,w4,w16,chave[1],chave[0]);
  andf  and6 (w25,w5,w17,w18,chave[2]);
  andf  and7 (w26,w6,w19,chave[2],chave[0]);
  andf  and8 (w27,w7,w20,chave[2],chave[1]);
  andf  and9 (w28,w8,chave[2],chave[1],chave[0]);

  oreight or2 (s,w21,w22,w23,w24,w25,w26,s27,w28);
  //O circuito requer uma or que receba oito bits.
  //Não consegui projetar essa porta, nem o and de 4 bits independentes.

endmodule