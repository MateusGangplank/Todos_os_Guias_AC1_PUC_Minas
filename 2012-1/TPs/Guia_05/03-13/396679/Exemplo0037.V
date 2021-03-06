// ------------------------- 
// Exemplo0037 - Somador Algebrico Com -1 em um dos operandos
// Nome: Bruno Cezar Andrade Viallet 
// Matricula: 396679
// ------------------------- 

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
  output [3:0] s;
  output c_out;
  input  [3:0] x, y;
  input c_in;
  wire c1, c2, c3, z1, z2, z3, z4, z5;
  // descrever por portas 
  xor (z1, y[0] , c_in);
  xor (z2, y[1] , c_in);
  xor (z3, y[2] , c_in);
  xor (z4, y[3] , c_in);
  FullAdder FA0(s[0], c1, x[0], z1, c_in);
  FullAdder FA1(s[1], c2, x[1], z2, c1);
  FullAdder FA2(s[2], c3, x[2], z3, c2);
  FullAdder FA3(s[3], z5, x[3], z4, c3);
  xor (c_out, z5 , c_in);
endmodule //somadorA

// ------------------------- 
// equals0
// ------------------------- 
module equals0(s, x);
  output s;
  input [3:0] x;
  wire s1,s2,s3,s4;
  
  // descrever por portas
  nor (s1, x[0], 0);
  nor (s2, x[1], 0);
  nor (s3, x[2], 0);
  nor (s4, x[3], 0);
  assign s = (s1 & s2 & s3 & s4);
  
endmodule // equals0

// ------------------------- 
// plus/minus 1
// ------------------------- 
module plusMinus1(s, x, op);
  output [3:0]s;
  input [3:0] x;
  input op;
  wire c_out;
  
  // descrever por portas
  somadorA somador(s, c_out, x, 0001, op); // -- op = 1 para opera�ao de subtra�ao x // op = 0 para opera�ao de soma x
  
endmodule // plusMinus1


module test_somadorA; 
// ------------------------- definir dados 
reg [3:0] x; 
reg [3:0] y; 
reg carry, op; 
wire [3:0] soma;
wire c_out, e0;
wire [3:0] x1; 


plusMinus1 minus(x1,x,op);
somadorA somador(soma, c_out, x1, y, carry);
equals0 equals(e0, soma);
// ------------------------- parte principal 
  initial
  begin
  $display("Exemplo0037 - Bruno Cezar Andrade Viallet - 396679"); 
  $display("Test Somador Algebrico - Plus/Minus Selecionavel"); 
  // projetar testes do somador complete 
  $monitor($time," x= %b x+/-1=%b  y=%b op= %b (op = 0 x+1 / op = 1 x-1)///  soma= %b /// equals 0 = %b (caso 1 verdadeiro caso 0 falso)\n", x, x1, y, op,soma,e0);
  end
  
  // Entradas
  initial
  begin
  $display("		Soma");
  x = 4'd2;y = 4'd4; carry =  1'b0;op=0;


  #5 x = 4'd2;y = 4'd4;
  #5 x = 4'd6;y = 4'd8;
  #5 x = 4'd1;y = 4'd3;op=1;
  #5 x = 4'd5;y = 4'd7;
  #5 x = 4'd10;y = 4'd5;
  
  
   #5 x = 4'd2;y = 4'd4;carry = 1'b1;op=0;
	$display("		Subtraction");
  #5 x = 4'd6;y = 4'd8;
  #5 x = 4'd3;y = 4'd3;op=1;
  #5 x = 4'd5;y = 4'd7;
  #5 x = 4'd10;y = 4'd5;


  end
endmodule // test_fullAdder 