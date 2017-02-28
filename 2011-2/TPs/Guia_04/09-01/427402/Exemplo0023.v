// ------------------------- 
// Exemplo0022 – FULL ADDER
// Nome: Felipe Ferreira Andrade do Carmo
// Matricula: 427402
// ------------------------- 

// -------------------------
//  Igualdade
// ------------------------- 
module Igualdade (output s, input a, input b);

xnor(s,a,b);

endmodule // igualdade
 
module teste_Igualdade;
// ------------------------- definir dados 
      reg [5:0] x; 
      reg [5:0] y;
      wire igualdadeFinal;

      
      Igualdade i1 (igualdade1,x[0],y[0]);
      Igualdade i2 (igualdade2,x[1],y[1]);
      Igualdade i3 (igualdade3,x[2],y[2]);
      Igualdade i4 (igualdade4,x[3],y[3]);
      Igualdade i5 (igualdade5,x[4],y[4]);
      Igualdade i6 (igualdade6,x[5],y[5]);

      and (igualdadeFinal,igualdade1,igualdade2,igualdade3,igualdade4,igualdade5,igualdade6);

// ------------------------- parte principal 
 initial begin 
      $display("Exemplo0022 - Felipe Ferreira Andrade do Carmo- 427402");
      $display("Test ALU’s full adder"); 

x = 6'b000111;  y = 6'b000101;
#1
$display("%6b e %6b =  igualdade %1b",x,y,igualdadeFinal);
#1
x = 6'b010011;  y = 6'b010101;
$display("%6b e %6b =  igualdade %1b",x,y,igualdadeFinal);
#1
x = 6'b000001;  y = 6'b000001;
$display("%6b e %6b = igualdade %1b",x,y,igualdadeFinal);

 end 
 
endmodule // test_fullAdder