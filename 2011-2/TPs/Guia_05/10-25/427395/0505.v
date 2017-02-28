//ARQ1 - GUIA05 - Autor: Eduardo Botelho de Andrade

//modulos complementares
module fa (output s, output cout, input a, input b, input cin);
   wire w1,w2,w3,w4;
       xor xor1 (w1,a,b);
       xor xor2 (s,c,w1);
       and and1 (w3,a,b);
       and and2 (w4,c,w1);
         or or1 (cout, w3,w4);

endmodule

//modulo principal
module equalsToZero (output equals,
            input [5:0] s);

   wire w1,w2,w3,w4,w5;

   xnor xnor1 (w1, s[0], 0);
   xnor xnor2 (w2, s[1], 0);
   xnor xnor3 (w3, s[2], 0);
   xnor xnor4 (w4, s[3], 0);
   xnor xnor2 (w5, s[4], 0);
   and (equals,w1,w2,w3,w4,w5);

endmodule

module comparator (output equals,
                   output greater,
                   output less,
                   input [5:0] a,
                   input [5:0] b);
  wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14;
  
  not not1 (w1,a[0]);
  not not2 (w2,a[1]);
  not not3 (w3,a[2]);
  not not4 (w4,a[3]);
  not not5 (w5,a[4]);
  not not6 (w6,a[5]);
  not not7 (w7,b[0]);
  not not8 (w8,b[1]);
  not not9 (w9,b[2]);
  not not10 (w10,b[3]);
  not not11 (w11,b[4]);
  not not12 (w12,b[5]);

  and and1 (w13,w1,b[0]);
  and and2 (w14,w7,a[0]);
  and and3 (w15,w2,b[1]);
  and and4 (w16,w8,a[1]);
  and and5 (w17,w3,b[2]);
  and and6 (w18,w9,a[2]);
  and and7 (w19,w4,b[3]);
  and and8 (w20,w10,a[3]);
  and and9 (w21,w5,b[4]);
  and and10 (w22,w11,a[4]);
  and and11 (w23,w6,b[5]);
  and and12 (w24,w12,a[5]);

  xnor xnor1 (w25,w13,w14);
  xnor xnor1 (w26,w15,w16);
  xnor xnor1 (w27,w17,w18);
  xnor xnor1 (w28,w19,w20);
  xnor xnor1 (w29,w21,w22);
  xnor xnor1 (w30,w23,w24);

  and and13 (equals,w25,w26,w27,w28,w29,w30);
  or or1 (less,w13,w15,w17,w19,w21,w23);
  or or2 (greater,w14,w16,w18,w20,w22,w24);

endmodule
//modulo de testes
module testAlu;
  reg [5:0] a;
  reg [5:0] b;
  wire equals;
  wire greater;
  wire less;

  comparator c1 (equals,greater,less,a,b);

  initial begin
   a=6'b000000;
   b=6'b000000;
  end

  initial begin
    $display("Teste ALU - Eduardo Botelho");
    $display("eq gr less    a        b     ");
    $monitor("%b %b %b %b %b",equals,greater,less,a,b);

    #1 a=6'b000001;
    #1 a=6'b000011;
    #1 b=6'b101010;
    #1 a=6'b111111;
    #1 a=6'b000000;


  end
endmodule


//Theldo, o circuito foi montado como deveria, mas não consigo associar os valores
//Das saídas com os bits de s.