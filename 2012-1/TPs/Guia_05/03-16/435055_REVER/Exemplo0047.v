// -------------------------
// Exemplo00043
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

//-------------------------
//-- Maior ou Menor
//-------------------------

module maiorMenor(output s1 , output s2 , input [3:0] a , input [3:0] b );
wire [3:0] soma;
wire carryOut;

	somador SOMADOR0( soma, carryOut , a , b , 1 );
	
	 assign s1 = soma[3]; //-- A < B
	 assign s2 = ~soma[3]; //-- A > B

endmodule //-- Fim maiorMenor 	

module test_somador; 
// ------------------------- definir dados
reg [3:0] x; 
reg [3:0] y; 
wire s1,s2; 
wire carryOut; 

maiorMenor MAIORMENOR0( s1 , s2 , x , y );



// ------------------------- parte principal 
  initial
  begin
  $display("Exemplo0047 - Samuel Eusébio da Silva - 435055"); 
  
  //--Testes
  $monitor($time," x = %b , y = %b  A < B = %b , A > B = %b" , x , y , s1 , s2 );
  end
  
  // Entradas
  initial
  begin
  x = 4'b0010;y = 4'b0100;


  #5 x = 4'b0001;y = 4'b1111;
  #5 x = 4'b0011;y = 4'b1011;
  #5 x = 4'b0001;y = 4'b1011;
  #5 x = 4'b0001;y = 4'b1011;
  $display("\n");
   #5 x = 4'b0010;y = 4'b0100;
   #5 x = 4'b1001;y = 4'b1111;
   #5 x = 4'b0011;y = 4'b1011;
   #5 x = 4'b0101;y = 4'b1011;
   #5 x = 4'b1001;y = 4'b1011;

  end
endmodule // --test