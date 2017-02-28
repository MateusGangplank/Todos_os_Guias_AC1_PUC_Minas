// ------------------------- 
// Exemplo0022 - 4bit FULL Subtractor 
// Nome: Bruno Cezar Andrade Viallet 
// Matricula: 396679
// ------------------------- 

// ------------------------- 
// full subtractor 
// ------------------------- 
module FullSubtractor(s, c_out, x, y, c_in);
  output s, c_out;
  input x, y, c_in;
  wire a, b, c;
// descrever por portas 
  xor (a, x, y);
  xor (s, a, c_in);   
  and (b, ~x, y);
  and (c, ~a, c_in);
  or (c_out, c, b);
endmodule //FullSubtractor

// ------------------------- 
// 4bit full Subtractor 
// ------------------------- 
module FourBitFullSubtractor(s, c_out, x, y, c_in);
  output [3:0] s;
  output c_out;
  input  [3:0] x, y;
  input c_in;
  wire c1, c2, c3;
  // descrever por portas 
  FullSubtractor FS0(s[0], c1, x[0], y[0], c_in);
  FullSubtractor FS1(s[1], c2, x[1], y[1], c1);
  FullSubtractor FS2(s[2], c3, x[2], y[2], c2);
  FullSubtractor FS3(s[3], c_out, x[3], y[3], c3);
endmodule //FourbitFullSubtractor

module test_fullAdder; 
// ------------------------- definir dados 
reg [3:0] x; 
reg [3:0] y; 
reg carry; 
wire [3:0] sub;
wire c_out; 

FourBitFullSubtractor FBFS1(sub, c_out, x, y, carry);
// ------------------------- parte principal 
  initial
  begin
  $display("Exemplo0022 - Bruno Cezar Andrade Viallet - 396679"); 
  $display("Test ALU's full subtractor"); 
  $monitor($time," x= %b y=%b c_in= %b /// carry out= %b soma= %b\n",x, y, carry,c_out,sub);
  end
  
  // Entradas
  initial
  begin
  x = 4'd2;y = 4'd4; carry = 1'b0;


  #5 x = 4'd2;y = 4'd4;
  #5 x = 4'd6;y = 4'd8;
  #5 x = 4'd1;y = 4'd3;
  #5 x = 4'd5;y = 4'd7;
  #5 x = 4'd10;y = 4'd5;carry = 1'b1;


  end
endmodule // test_fullSubtractor 