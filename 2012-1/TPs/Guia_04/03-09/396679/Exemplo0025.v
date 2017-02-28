// ------------------------- 
// Exemplo0025 - 4bit Complemento de 2
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
// 4bit full adder 
// ------------------------- 
module FourBitFullAdder(s, c_out, x, y, c_in);
  output [3:0] s;
  output c_out;
  input  [3:0] x, y;
  input c_in;
  wire c1, c2, c3;
  // descrever por portas 
  FullAdder FA0(s[0], c1, x[0], y[0], c_in);
  FullAdder FA1(s[1], c2, x[1], y[1], c1);
  FullAdder FA2(s[2], c3, x[2], y[2], c2);
  FullAdder FA3(s[3], c_out, x[3], y[3], c3);
endmodule //FourbitFullAdder

// ------------------------- 
// Complemento de 2 
// ------------------------- 
module Complemento2(s, x);
  output [3:0] s;
  input  [3:0] x;
  wire [3:0] c1;
  wire c_out;
  // Complemento de 1
  assign c1 = ~x ;
  
  //complemento de 2
  FourBitFullAdder FA (s,c_out, c1, 0001, 0);
endmodule // complemento2

module test_complemento2; 
// ------------------------- definir dados 
reg [3:0] x; 
wire [3:0] s;

Complemento2 compl(s, x);
// ------------------------- parte principal 
  initial
  begin
  $display("Exemplo0025 - Bruno Cezar Andrade Viallet - 396679"); 
  $display("Teste Complemento de 2"); 
  // testes
  $monitor($time," x= %b // Complemento de 2 = %b", x, s);
  end
  
  // Entradas
  initial
  begin
  x = 4'd2;


  #5 x = 4'd2;
  #5 x = 4'd6;
  #5 x = 4'd1;
  #5 x = 4'd5;
  #5 x = 4'd10;


  end
endmodule // test_complemento2