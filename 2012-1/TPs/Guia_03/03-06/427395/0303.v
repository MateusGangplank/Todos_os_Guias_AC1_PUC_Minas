//ARQ1 - Eduardo Botelho de Andrade - Guia03

module rand (output [3:0] s,
             input  [3:0] a,
             input  [3:0] b);

 and and1 (s[0],a[0],b[0]);
 and and2 (s[1],a[1],b[1]);
 and and3 (s[2],a[2],b[2]);
 and and4 (s[3],a[3],b[3]);

endmodule 

module ror (output [3:0] s,
            input [3:0] a,
            input [3:0] b);
            
 or or1 (s[0],a[0],b[0]);
 or or2 (s[1],a[1],b[1]);
 or or3 (s[2],a[2],b[2]);
 or or4 (s[3],a[3],b[3]);

endmodule

module rnand (output [3:0] s,
             input  [3:0] a,
             input  [3:0] b);

 nand nand1 (s[0],a[0],b[0]);
 nand nand2 (s[1],a[1],b[1]);
 nand nand3 (s[2],a[2],b[2]);
 nand nand4 (s[3],a[3],b[3]);
 
endmodule

module rnor (output [3:0] s,
            input [3:0] a,
            input [3:0] b);
            
 nor nor1 (s[0],a[0],b[0]);
 nor nor2 (s[1],a[1],b[1]);
 nor nor3 (s[2],a[2],b[2]);
 nor nor4 (s[3],a[3],b[3]);

endmodule

module rnot (output [3:0] s,
             input [3:0] a);

 assign s = ~a;

endmodule

module f4 (output [3:0] s,
           input [3:0] chave, //definida apenas por 0000 ou 0001
           input [3:0] grupo, //definida da mesma forma que a chave
           input [3:0] a,
           input [3:0] b);

 wire [3:0] w1;
 wire [3:0] w2;
 wire [3:0] w3;
 wire [3:0] w4;
 wire [3:0] w5;
 wire [3:0] w6;
 wire [3:0] w7;
 wire [3:0] w8;
 wire [3:0] w9;
 wire [3:0] w10;
 wire [3:0] w11;
 wire [3:0] w12;
 wire [3:0] w13;
 wire [3:0] w14;

 //parte de cima
 rand and1 (w1,a,b);
 ror or1 (w2,a,b);

 //seletor chave
 rnot not1 (w3,chave);

 //parte de baixo
 rnand nand1 (w4,a,b);
 rnor nor1 (w5,a,b);

 //mux1
 rand and2 (w6,w1,chave);
 rand and3 (w7,w2,w3);
 rand and4 (w8,w4,w3);
 rand and5 (w9,w5,chave);

 //saidas mux1
 ror or2 (w10,w6,w7);
 ror or3 (w11,w8,w9);

 //mux2
 rnot not2 (w12,grupo);
 rand and6 (w13,w10,grupo);
 rand and7 (w14,w11,w12);
 
 //saida
 ror or4 (s,w13,w14);

endmodule

module test_f4;
       reg  [3:0] x;
       reg  [3:0] y;
       reg  [3:0] grupo;
       reg  [3:0] chave;
       wire [3:0] z;

       f4 modulo (z,chave,grupo,x,y);


   initial begin
      $display("Eduardo Botelho de Andrade - 427395");
      $display("Test LU's module");
      $display("Chave: 0 = OR / 1 = AND");
      $monitor("x = %b , y = %b , s = %b     - chave = %b , grupo = %b",x,y,z,chave,grupo);

      #1 x = 4'b0000; y = 4'b0000; chave = 4'b0000; grupo = 4'b0000;
      #1 y = 4'b0001;
      #1 y = 4'b0010;
      #1 y = 4'b0011;
      #1 y = 4'b0100;
      #1 y = 4'b0101;
      #1 y = 4'b0110;
      #1 y = 4'b0111;
      #1 y = 4'b1000;
      #1 y = 4'b1001;
      #1 y = 4'b1010;
      #1 y = 4'b1011;
      #1 y = 4'b1100;
      #1 y = 4'b1101;
      #1 y = 4'b1111;

      #1 x = 4'b0001;
      #1 y = 4'b0000;
      #1 y = 4'b0001;
      #1 y = 4'b0010;
      #1 y = 4'b0011;
      #1 y = 4'b0100;
      #1 y = 4'b0101;
      #1 y = 4'b0110;
      #1 y = 4'b0111;
      #1 y = 4'b1000;
      #1 y = 4'b1001;
      #1 y = 4'b1010;
      #1 y = 4'b1011;
      #1 y = 4'b1100;
      #1 y = 4'b1101;
      #1 y = 4'b1111;

      #1 x = 4'b0010;
      #1 y = 4'b0000;
      #1 y = 4'b0001;
      #1 y = 4'b0010;
      #1 y = 4'b0011;
      #1 y = 4'b0100;
      #1 y = 4'b0101;
      #1 y = 4'b0110;
      #1 y = 4'b0111;
      #1 y = 4'b1000;
      #1 y = 4'b1001;
      #1 y = 4'b1010;
      #1 y = 4'b1011;
      #1 y = 4'b1100;
      #1 y = 4'b1101;
      #1 y = 4'b1111;

      #1 x = 4'b0011;

      #1 y = 4'b0000;
      #1 y = 4'b0001;
      #1 y = 4'b0010;
      #1 y = 4'b0011;
      #1 y = 4'b0100;
      #1 y = 4'b0101;
      #1 y = 4'b0110;
      #1 y = 4'b0111;
      #1 y = 4'b1000;
      #1 y = 4'b1001;
      #1 y = 4'b1010;
      #1 y = 4'b1011;
      #1 y = 4'b1100;
      #1 y = 4'b1101;
      #1 y = 4'b1111;

      #1 x = 4'b0100;

      #1 y = 4'b0000;
      #1 y = 4'b0001;
      #1 y = 4'b0010;
      #1 y = 4'b0011;
      #1 y = 4'b0100;
      #1 y = 4'b0101;
      #1 y = 4'b0110;
      #1 y = 4'b0111;
      #1 y = 4'b1000;
      #1 y = 4'b1001;
      #1 y = 4'b1010;
      #1 y = 4'b1011;
      #1 y = 4'b1100;
      #1 y = 4'b1101;
      #1 y = 4'b1111;

      #1 x = 4'b0101;

      #1 y = 4'b0000;
      #1 y = 4'b0001;
      #1 y = 4'b0010;
      #1 y = 4'b0011;
      #1 y = 4'b0100;
      #1 y = 4'b0101;
      #1 y = 4'b0110;
      #1 y = 4'b0111;
      #1 y = 4'b1000;
      #1 y = 4'b1001;
      #1 y = 4'b1010;
      #1 y = 4'b1011;
      #1 y = 4'b1100;
      #1 y = 4'b1101;
      #1 y = 4'b1111;

      #1 x = 4'b0110;

      #1 y = 4'b0000;
      #1 y = 4'b0001;
      #1 y = 4'b0010;
      #1 y = 4'b0011;
      #1 y = 4'b0100;
      #1 y = 4'b0101;
      #1 y = 4'b0110;
      #1 y = 4'b0111;
      #1 y = 4'b1000;
      #1 y = 4'b1001;
      #1 y = 4'b1010;
      #1 y = 4'b1011;
      #1 y = 4'b1100;
      #1 y = 4'b1101;
      #1 y = 4'b1111;

      #1 x = 4'b0111;

      #1 y = 4'b0000;
      #1 y = 4'b0001;
      #1 y = 4'b0010;
      #1 y = 4'b0011;
      #1 y = 4'b0100;
      #1 y = 4'b0101;
      #1 y = 4'b0110;
      #1 y = 4'b0111;
      #1 y = 4'b1000;
      #1 y = 4'b1001;
      #1 y = 4'b1010;
      #1 y = 4'b1011;
      #1 y = 4'b1100;
      #1 y = 4'b1101;
      #1 y = 4'b1111;

      #1 x = 4'b1000;  chave = 4'b0001;

      #1 y = 4'b0000;
      #1 y = 4'b0001;
      #1 y = 4'b0010;
      #1 y = 4'b0011;
      #1 y = 4'b0100;
      #1 y = 4'b0101;
      #1 y = 4'b0110;
      #1 y = 4'b0111;
      #1 y = 4'b1000;
      #1 y = 4'b1001;
      #1 y = 4'b1010;
      #1 y = 4'b1011;
      #1 y = 4'b1100;
      #1 y = 4'b1101;
      #1 y = 4'b1111;
      
      #1 x = 4'b1001;

      #1 y = 4'b0000;
      #1 y = 4'b0001;
      #1 y = 4'b0010;
      #1 y = 4'b0011;
      #1 y = 4'b0100;
      #1 y = 4'b0101;
      #1 y = 4'b0110;
      #1 y = 4'b0111;
      #1 y = 4'b1000;
      #1 y = 4'b1001;
      #1 y = 4'b1010;
      #1 y = 4'b1011;
      #1 y = 4'b1100;
      #1 y = 4'b1101;
      #1 y = 4'b1111;
      
      #1 x = 4'b1010;

      #1 y = 4'b0000;
      #1 y = 4'b0001;
      #1 y = 4'b0010;
      #1 y = 4'b0011;
      #1 y = 4'b0100;
      #1 y = 4'b0101;
      #1 y = 4'b0110;
      #1 y = 4'b0111;
      #1 y = 4'b1000;
      #1 y = 4'b1001;
      #1 y = 4'b1010;
      #1 y = 4'b1011;
      #1 y = 4'b1100;
      #1 y = 4'b1101;
      #1 y = 4'b1111;
      
      #1 x = 4'b1011;

      #1 y = 4'b0000;
      #1 y = 4'b0001;
      #1 y = 4'b0010;
      #1 y = 4'b0011;
      #1 y = 4'b0100;
      #1 y = 4'b0101;
      #1 y = 4'b0110;
      #1 y = 4'b0111;
      #1 y = 4'b1000;
      #1 y = 4'b1001;
      #1 y = 4'b1010;
      #1 y = 4'b1011;
      #1 y = 4'b1100;
      #1 y = 4'b1101;
      #1 y = 4'b1111;
      
      #1 x = 4'b1100;

      #1 y = 4'b0000;
      #1 y = 4'b0001;
      #1 y = 4'b0010;
      #1 y = 4'b0011;
      #1 y = 4'b0100;
      #1 y = 4'b0101;
      #1 y = 4'b0110;
      #1 y = 4'b0111;
      #1 y = 4'b1000;
      #1 y = 4'b1001;
      #1 y = 4'b1010;
      #1 y = 4'b1011;
      #1 y = 4'b1100;
      #1 y = 4'b1101;
      #1 y = 4'b1111;

      #1 x=4'b1101;

      #1 y = 4'b0000;
      #1 y = 4'b0001;
      #1 y = 4'b0010;
      #1 y = 4'b0011;
      #1 y = 4'b0100;
      #1 y = 4'b0101;
      #1 y = 4'b0110;
      #1 y = 4'b0111;
      #1 y = 4'b1000;
      #1 y = 4'b1001;
      #1 y = 4'b1010;
      #1 y = 4'b1011;
      #1 y = 4'b1100;
      #1 y = 4'b1101;
      #1 y = 4'b1111;

      #1 x=4'b1110;

      #1 y = 4'b0000;
      #1 y = 4'b0001;
      #1 y = 4'b0010;
      #1 y = 4'b0011;
      #1 y = 4'b0100;
      #1 y = 4'b0101;
      #1 y = 4'b0110;
      #1 y = 4'b0111;
      #1 y = 4'b1000;
      #1 y = 4'b1001;
      #1 y = 4'b1010;
      #1 y = 4'b1011;
      #1 y = 4'b1100;
      #1 y = 4'b1101;
      #1 y = 4'b1111;

      #1 x=4'b1111;

      #1 y = 4'b0000;
      #1 y = 4'b0001;
      #1 y = 4'b0010;
      #1 y = 4'b0011;
      #1 y = 4'b0100;
      #1 y = 4'b0101;
      #1 y = 4'b0110;
      #1 y = 4'b0111;
      #1 y = 4'b1000;
      #1 y = 4'b1001;
      #1 y = 4'b1010;
      #1 y = 4'b1011;
      #1 y = 4'b1100;
      #1 y = 4'b1101;
      #1 y = 4'b1111;

   end

endmodule // test_f4
