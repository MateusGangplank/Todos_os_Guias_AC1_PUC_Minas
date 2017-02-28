// -------------------------
// Exemplo0023 e 24 – FULL ADDER
// Nome: Felipe Ferreira Andrade do Carmo
// Matricula: 427402
// ------------------------- 

// -------------------------
//  Igualdade
// ------------------------- 
module Igualdade (output s, input [5:0]a, input[5:0] b);

 xor (igualdade1,a[0],b[0]);
 xor (igualdade2,a[1],b[1]);
 xor (igualdade3,a[2],b[2]);
 xor (igualdade4,a[3],b[3]);
 xor (igualdade5,a[4],b[4]);
 xor (igualdade6,a[5],b[5]);

 nor (s4, igualdade1, igualdade2);
 nor (s3, s4, igualdade3);
 nor (s2, s3, igualdade4);
 nor (s, s2, igualdade5);

endmodule // igualdade
 
module teste_Igualdade;
// ------------------------- definir dados 
      reg [5:0] x;
      reg [5:0] y;
      wire igualdadeFinal;

      
     Igualdade h1 (igualdadeFinal, x,y);


// ------------------------- parte principal 
 initial begin 
      $display("Exemplo0023 e 24 - Felipe Ferreira Andrade do Carmo- 427402");
      $display("Test ALU’s Igualdade"); 
      $display("0: igual     1:diferente");

x = 6'b000111;  y = 6'b000101;
#1
$display("%6b e %6b =  igualdade %1b",x,y,igualdadeFinal);
#1
x = 6'b010011;  y = 6'b010101;
$display("%6b e %6b =  igualdade %1b",x,y,igualdadeFinal);
#1
x = 6'b000011;  y = 6'b000011;
$display("%6b e %6b = igualdade %1b",x,y,igualdadeFinal);

 end 
 
endmodule // test_fullAdder