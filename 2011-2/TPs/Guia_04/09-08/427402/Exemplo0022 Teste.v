// -------------------------
// Exemplo0022 – FULL ADDER
// Nome: Felipe Ferreira Andrade do Carmo
// Matricula: 427402
// ------------------------- 

// -------------------------
//  Halth adder 
// ------------------------- 
module HA (output s, output s1,
                               input a,  
                               input b); 
xor (s,a,b);
and(s1,a,b);

 
endmodule //HA


// ------------------------- 
//  full adder 
// ------------------------- 
module FA (output s, output carry,
                               input a,  
                               input b,  
                               input carryIn); 
wire w1,w0,w3;

 HA h1 (w1,w0,a,b);
 HA h2 (s,w3, carryIn, w1);
 or(carry,w3,w0);


endmodule // fullAdder

// -------------------------
//  full adder 
// ------------------------- 
module XorEntrada (output s, input a, input b);

xor(s,a,b);

endmodule // fullAdder

// -------------------------
//  somando
// -------------------------
module Somando (output [5:0] soma, input [5:0]a, input [5:0]b ,input carryIn);
// ------------------------- definir dados 


      XorEntrada x1 (bb, b[0],carryIn);
      XorEntrada x2 (bc, b[1],carryIn);
      XorEntrada x3 (bd, b[2],carryIn);
      XorEntrada x4 (be, b[3],carryIn);
      XorEntrada x5 (bf, b[4],carryIn);
      XorEntrada x6 (bg, b[5],carryIn);

      FA f1 (soma[0],carryOut, a[0],bb,  carryIn);
      FA f2 (soma[1],carryOut1,a[1],bc, carryOut);
      FA f3 (soma[2],carryOut2,a[2],bd, carryOut1);
      FA f4 (soma[3],carryOut3,a[3],be, carryOut2);
      FA f5 (soma[4],carryOut4,a[4],bf, carryOut3);
      FA f6 (soma[5],carryOut5,a[5],bg, carryOut4);
  endmodule // somando
  
  module test_fullAdder;
// ------------------------- definir dados
      reg [5:0]x;
      reg [5:0]y;
      reg C;
      wire[5:0] soma;
      
      Somando s1 (soma,x,y, C);

  

// ------------------------- parte principal 
 initial begin 
      $display("Exemplo0022 - Felipe Ferreira Andrade do Carmo- 427402");
      $display("Test ALU’s full adder");
      $display("Se C=1, subtraçao / C=0 , soma. " );

x = 6'b000111;  y = 6'b000101;  C = 0'b1;
#1
$display("%6b + %6b = %6b  / C= %1b ",x,y,soma, C);
#1
x = 6'b010011;  y = 6'b010101;  C = 1'b1;
$display("%6b + %6b = %6b  / C= %1b ",x,y,soma, C);
#1
x = 6'b111111;  y = 6'b000000;  C = 0'b1;
$display("%6b + %6b = %6b  / C= %1b ",x,y,soma, C);
 
 end 
 
endmodule // test_fullAdder