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
module alu (output [4:0] s,
            output cout,
            input [5:0] a,
            input [5:0] b);

   wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14;
   wire cout0,cout1,cout2,cout3,cout4;
   
     or or1 (w1, a[5], b[5]); //or das carry-ins de a e b, decidirão qual operação será realizada
   xor xor1 (w2, w1, b[4]);
   xor xor2 (w3, w1, b[3]);
   xor xor3 (w4, w1, b[2]);
   xor xor4 (w5, w1, b[1]);
   xor xor2 (w6, w1, b[0]);
     fa fa1 (s[0], cout0, a[0], w6, w1);
     fa fa2 (s[1], cout1, a[1], w5, cout0);
     fa fa3 (s[2], cout2, a[2], w4, cout1);
     fa fa4 (s[3], cout3, a[3], w3, cout2);
     fa fa5 (s[4], cout, a[4], w2, cout3);
     
endmodule

//modulo de testes
module testAlu;
  reg [5:0] a;
  reg [5:0] b;
  wire [4:0] s;
  wire cout;

  alu alu1 (s,cout,a,b);

  initial begin
   a=6'b000000; b=6'b000000;
  end

  initial begin
    $display("Teste ALU - Eduardo Botelho");
    $display("co     s        a         b");
    $monitor("%b %b %b %b",cout,s,a,b);

    #1 a=6'b000001;
    #1 a=6'b000011; b=6'b000001;
    #1 a=6'b000000; b=6'b001110;

  end
endmodule


//Theldo, o circuito foi montado como deveria, mas não consigo associar os valores
//Das saídas com os bits de s.