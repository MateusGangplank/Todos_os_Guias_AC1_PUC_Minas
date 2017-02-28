//ARQ1 - Eduardo Botelho de Andrade - 427395


//modulo para complemento de um
module complementOne (output [5:0] s,
                      input [5:0] a);

     not not1 (s[5],a[5]);
     not not2 (s[4],a[4]);
     not not3 (s[3],a[3]);
     not not4 (s[2],a[2]);
     not not5 (s[1],a[1]);
     not not6 (s[0],a[0]);

endmodule

//modulo para soma completa
module fa (output s, output cout, input a, input b, input cin);
   wire w1,w2,w3,w4;
       xor xor1 (w1,a,b);
       xor xor2 (s,c,w1);
       and and1 (w3,a,b);
       and and2 (w4,c,w1);
         or or1 (cout, w3,w4);

endmodule

module fullAdder (output [4:0] s,
                     output cout,
                   input [5:0] a,
                   input [5:0] b,
                   input carryIn);

     reg cin;
     wire w1,w2,w3,w4,w5,w6,w7,w8;

     fa fa1(s[0],w1,a[0],b[0],cin);
     fa fa2(s[1],w2,a[1],b[1],w1);
     fa fa3(s[2],w3,a[2],b[2],w2);
     fa fa4(s[3],w4,a[3],b[3],w3);
     fa fa5(s[4],w5,a[4],b[4],w4);
     fa fa6(cout,w6,a[5],b[5],w5);


endmodule

//modulo para complemento de dois
module complementTwo (output [4:0] s,
                      output cout,
                      input [5:0] a,
                      input [5:0] b);
  reg cin = 1'b1;
  wire [5:0] w1;

  complementOne c1 (w1,a);
  fullAdder fa1 (s, cout, w1, b, cin);

endmodule

//modulo de testes
module testAlu;

 reg [5:0] a;
 reg [5:0] b;
 wire [4:0] s;
 wire cout;

 complementTwo c2 (s,cout,a,b);
 
 initial begin
  b = 6'b000001;
  a = 6'b000001;
 end

 initial begin
   $display ("Modulo para calcular complemento de dois.");
   $display ("Autor: Eduardo Botelho");
   $display ();
   $display ("s                a");
   $monitor ("%b %b %b",cout,s,a);
   
   #1 a=6'b100000;
   #1 a=6'b001010;
 end

endmodule


//Theldo, não consegui fazer com que o resultado fosse o esperado. O retorno é só xxxxxx