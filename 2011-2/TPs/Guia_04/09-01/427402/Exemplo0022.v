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
xor (s,a,b);                // VER MODIFICACAO NO EXERCICIO ANTERIOR
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
 
module test_fullAdder; 
// ------------------------- definir dados 
      reg [5:0] x; 
      reg [5:0] y;
      reg carryIn;
      wire [5:0] soma;
      wire overflow;
      wire  carryOut, carryOut1, carryOut2,carryOut3, carryOut4, carryOut5;
      
      XorEntrada x1 (yb, y[0],carryIn);
      XorEntrada x2 (yc, y[1],carryIn);
      XorEntrada x3 (yd, y[2],carryIn);
      XorEntrada x4 (ye, y[3],carryIn);
      XorEntrada x5 (yf, y[4],carryIn);
      XorEntrada x6 (yg, y[5],carryIn);

      FA f1 (soma[0],carryOut, x[0],yb,  carryIn);
      FA f2 (soma[1],carryOut1,x[1],yc, carryOut);
      FA f3 (soma[2],carryOut2,x[2],yd, carryOut1);
      FA f4 (soma[3],carryOut3,x[3],ye, carryOut2);
      FA f5 (soma[4],carryOut4,x[4],yf, carryOut3);
      FA f6 (soma[5],carryOut5,x[5],yg, carryOut4);
      xor (overflow, carryOut5, carryIn);
 
// ------------------------- parte principal 
 initial begin 
      $display("Exemplo0022 - Felipe Ferreira Andrade do Carmo- 427402");
      $display("Test ALU’s full adder"); 

x = 6'b000111;  y = 6'b000101;  carryIn = 1'b1;
#1
$display("%6b + %6b = %b Carry: %1b , Overflow: %1b",x,y,soma, carryIn,overflow);
#1
x = 6'b010011;  y = 6'b010101;  carryIn = 1'b1;
$display("%6b + %6b = %b Carry: %1b, Overflow: %1b",x,y,soma, carryIn,overflow);
#1
x = 6'b111111;  y = 6'b000000;  carryIn = 1'b1;
$display("%6b + %6b = %b Carry: %1b, Overflow: %1b",x,y,soma, carryIn,overflow);
 
 end 
 
endmodule // test_fullAdder