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
                   input [5:0] s);

  xnor xnor1 (w1,s[0],0);
  xnor xnor2 (w2,s[1],0);
  xnor xnor3 (w3,s[2],0);
  xnor xnor4 (w4,s[3],0);
  xnor xnor5 (w5,s[4],0);
  xnor xnor6 (w6,s[5],0);
  and and1 (equals,w1,w2,w3,w4,w5,w6);

endmodule
//modulo de testes
module testAlu;
  reg [5:0] s;
  wire equals;

  equalsToZero etz1 (equals, s);

  initial begin
   s=6'b000000;
  end

  initial begin
    $display("Teste ALU - Eduardo Botelho");
    $display("eq    s ");
    $monitor("%b %b",equals,s);

    #1 s=6'b000001;
    #1 s=6'b000011;
    #1 s=6'b101010;
    #1 s=6'b111111;
    #1 s=6'b000000;


  end
endmodule


//Theldo, o circuito foi montado como deveria, mas não consigo associar os valores
//Das saídas com os bits de s.