// ------------------------- 
// Exemplo0036
// Nome: Alvaro Henrique de Araujo Rungue
// Matricula: 395487
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

module test_exemplo0036; 
// ------------------------- definir dados 
reg [3:0] x; 
reg [3:0] y; 
reg carry; 
wire [3:0] soma;
wire overflow , resp; 

somador SOMADOR0(soma, overflow, x, y, carry);

//-- VErificar se o resultado e 0
verificarSeE0 VERIFICAR0(resp, soma);

// ------------------------- parte principal 
  initial
  begin
  $display("Exemplo0036 - Alvaro Henrique de Araujo Rungue - 395487"); 
  $display("Test Exemplo0036: "); 
  
  //--Testes
  $monitor($time," x = %b y = %b carryIn = %b ********* overflow = %b soma = %b *** Verificacao se e 0 : %b\n",x, y, carry,overflow,soma,resp );
  end
  
  // Entradas
  initial
  begin
  x = 4'b0010;y = 4'b0100; carry = 1'b0;


  #5 x = 4'b0001;y = 4'b1111;
  #5 x = 4'b0011;y = 4'b1011;
  #5 x = 4'b0001;y = 4'b1011;
  #5 x = 4'b0001;y = 4'b1011;
  
   #5 x = 4'b0010;y = 4'b0100;carry = 1'b1;
   #5 x = 4'b1001;y = 4'b1111;
   #5 x = 4'b0011;y = 4'b1011;
   #5 x = 4'b0101;y = 4'b1011;
   #5 x = 4'b1001;y = 4'b1011;

  end
endmodule // --test