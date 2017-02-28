// -------------------------
// Exemplo00049
// Nome: Samuel Eusébio da Silva
// Matricula: 435055
// -------------------------


// ------------------------- 
// Full adder 
// ------------------------- 

module FullAdder(s, carryOut, x, y, carryIn);
  output s, carryOut;
  input x, y, carryIn;
  wire a, b, c;

//-- portas 
  xor (a, x, y);
  xor (s, a, carryIn);   
  and (b, x, y);
  and (c, a, carryIn);
  or (carryOut, c, b);
  
endmodule //--FullAdder

// ------------------------- 
// somador
// ------------------------- 

module somador(s, carryOut, x, y, carryIn);
  output [3:0] s;
  output carryOut;
  input  [3:0] x, y;
  input carryIn;
  
  wire c1, c2, c3, z1, z2, z3, z4, z5;
  
  //--portas 
  xor (z1, y[0] , carryIn);
  xor (z2, y[1] , carryIn);
  xor (z3, y[2] , carryIn);
  xor (z4, y[3] , carryIn);
  FullAdder FULLADDER0(s[0], c1, x[0], z1, carryIn);
  FullAdder FULLADDER1(s[1], c2, x[1], z2, c1);
  FullAdder FULLADDER2(s[2], c3, x[2], z3, c2);
  FullAdder FULLADDER3(s[3], z5, x[3], z4, c3);
  xor (carryOut, z5 , carryIn);
  
endmodule //--somador

 module verificarSeE0(output s , input [3:0] a);
 
 wire tmp0,tmp1,tmp2,tmp3;
 
 nor NOR0( tmp0 , 0 , a[0]);
 nor NOR1( tmp1 , 0 , a[1]);
 nor NOR2( tmp2 , 0 , a[2]);
 nor NOR3( tmp3 , 0 , a[3]);
 
 assign s = tmp0 & tmp1 & tmp2 & tmp3;
 
endmodule //-- FIm testa se e 0

// ------------------------- 
//  Soma e Subs
// -------------------------

module somaSubs( output [3:0] s , input [3:0] a , input operador );

wire carryOut;

somador SOMADOR0( s , carryOut , a , 0001 , operador );


endmodule //-- Fim SomaSub



module test_exemplo0049; 
// ------------------------- definir dados 
reg [3:0] x;
 
reg [3:0] y; 
reg operador;
reg carry; 
wire [3:0] soma , xPlus1;
wire carryOut , resp; 

//-- operador 1 pois e uma subtracao

somaSubs SOMASUBS1(xPlus1 , x ,  operador );
somador SOMADOR0(soma, carryOut, x, y, carry);

//-- VErificar se o resultado e 0
verificarSeE0 VERIFICAR0(resp, soma);

// ------------------------- parte principal 
  initial
  begin
  $display("Exemplo0049 - Samuel Eusébio da Silva - 435055"); 
  
  //--Testes
  $monitor($time," x = %b , x +/- 1 = %b , Operador = %b , y = %b carryIn = %b * carry out = %b soma = %b Verificacao se e 0 : %b\n",x , xPlus1 , operador , y, carry,carryOut,soma,resp );
  end
  
  // Entradas
  initial
  begin
  x = 4'b0010;y = 4'b0100; carry = 1'b0; operador = 1'b0;


  #5 x = 4'b0001;y = 4'b1111;
  #5 x = 4'b0011;y = 4'b1011;
  #5 x = 4'b0001;y = 4'b1011;
  #5 x = 4'b0001;y = 4'b1011;
  
  $display("\n"); 
   #5 x = 4'b0010;y = 4'b0100;carry = 1'b1; operador = 1'b1;
   #5 x = 4'b1001;y = 4'b1111;
   #5 x = 4'b0011;y = 4'b1011;
   #5 x = 4'b0101;y = 4'b1011;
   #5 x = 4'b1001;y = 4'b1011;

  end
endmodule // --test