// ------------------------- 
// Exemplo0026 - Extra 01
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

module test_somadorA; 
// ------------------------- definir dados 
reg [3:0] x; 
reg [3:0] y; 
reg carry; 
wire [3:0] soma;
wire c_out; 

somadorA somador(soma, c_out, x, y, carry);
// ------------------------- parte principal 
  initial
  begin
  $display("Exemplo0026 - Bruno Cezar Andrade Viallet - 396679"); 
  $display("Test Somador Algebrico"); 
  // projetar testes do somador complete 
  $monitor($time," x= %b y=%b c_in= %b /// carry out= %b soma= %b\n",x, y, carry,c_out,soma);
  end
  
  // Entradas
  initial
  begin
  x = 4'd2;y = 4'd4; carry = 1'b0;


  #5 x = 4'd2;y = 4'd4;
  #5 x = 4'd6;y = 4'd8;
  #5 x = 4'd1;y = 4'd3;
  #5 x = 4'd5;y = 4'd7;
  #5 x = 4'd10;y = 4'd5;
  
   #5 x = 4'd2;y = 4'd4;carry = 1'b1;
  #5 x = 4'd6;y = 4'd8;
  #5 x = 4'd1;y = 4'd3;
  #5 x = 4'd5;y = 4'd7;
  #5 x = 4'd10;y = 4'd5;


  end
endmodule // test_fullAdder 