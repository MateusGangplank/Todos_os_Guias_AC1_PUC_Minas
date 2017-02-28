// ------------------------- 
// Exemplo0033
// Nome: Gabriel Benjamim de Carvalho 
// Matricula: 396690
// ------------------------- 

// EXERCÍCIO 03

// ------------------------- 
// nbit adder 
// ------------------------- 
module FullAdder(s, c_out, x, y, c_in);
  output s, c_out;
  input x, y, c_in;
  wire a, b, c;
// descrever por portas 
  xor (a, x, y);
  xor (s, a, c_in);   
  and (b, x, y);
  and (c, a, c_in);
  or (c_out, c, b);
endmodule //FullAdder

// ------------------------- 
// somador algebrico
// ------------------------- 
module somadorA(s, c_out, x, y, c_in);
  output [2:0] s;
  output c_out;
  input  [2:0] x, y;
  input c_in;
  wire c1, c2, z1, z2, z3, z4;
  // descrever por portas 
  xor (z1, y[0] , c_in);
  xor (z2, y[1] , c_in);
  xor (z3, y[2] , c_in);
  FullAdder FA0(s[0], c1, x[0], z1, c_in);
  FullAdder FA1(s[1], c2, x[1], z2, c1);
  FullAdder FA2(s[2], z4, x[2], z3, c2);
  xor (c_out, z4 , c_in);
endmodule //somadorA

// ------------------------- 
// equals0
// ------------------------- 
module equals0(s, x);
  output s;
  input [2:0] x;
  wire s1,s2,s3;
  
  // descrever por portas
  nor (s1, x[0], 0);
  nor (s2, x[1], 0);
  nor (s3, x[2], 0);
  assign s = (s1 & s2 & s3);
  
endmodule // equals0

// ------------------------- 
// plus/minus 1
// ------------------------- 
module plusMinus1(s, x);
  output [2:0]s;
  input [2:0] x;
  wire c_out;
  
  // descrever por portas
  somadorA somador(s, c_out, x, 001, 0); // -- c_in = 0 para operaçao de soma x + 0001
 
endmodule // plusMinus1


module test_somadorA; 
// ------------------------- definir dados 
reg [2:0] x; 
reg [2:0] y; 
reg carry; 
wire [2:0] soma;
wire c_out, e0;
wire [2:0] x1; 


plusMinus1 plus(x1,x);
somadorA somador(soma, c_out, x1, y, carry);
equals0 equals(e0, soma);
// ------------------------- parte principal 
  initial
  begin
  $display("Exemplo0032 - Gabriel Benjamim de Carvalho - 396690"); 
  $display("Test Somador Algebrico - Plus 1"); 
  // projetar testes do somador complete 
  $monitor($time," x= %b x+1=%b  y=%b c_in= %b ///  soma= %b /// equals 0 = %b (caso 1 verdadeiro caso 0 falso)\n", x, x1, y, carry,soma,e0);
  end
  
  // Entradas
  initial
  begin
  $display("		Soma");
  x = 3'd2;y = 3'd4; carry =  1'b0;


  #5 x = 3'd2;y = 3'd3;
  #5 x = 3'd3;y = 3'd3;
  #5 x = 3'd1;y = 3'd3;
  #5 x = 3'd1;y = 3'd1;
  #5 x = 3'd3;y = 3'd2;
  
  
   #5 x = 3'd2;y = 3'd4;carry = 1'b1;
	$display("		Subtraction");
  #5 x = 3'd2;y = 3'd3;
  #5 x = 3'd1;y = 3'd2;
  #5 x = 3'd2;y = 3'd2;
  #5 x = 3'd0;y = 3'd2;


  end
endmodule // test_fullAdder 