//Guia04 - ARQ1 - Eduardo Botelho de Andrade

`include "fs.v"

module fs4bit (output [2:0] s,
               output carryout,
               input [3:0] a, input [3:0] b,
               input carryin);

  or or1 (sinal,a[3],b[3]);
  fs fs1 (s[0],w1,a[0],b[0],sinal);
  fs fs2 (s[1],w2,a[1],b[1],w1);
  fs fs3 (s[2],carryout,a[2],b[2],w2);

endmodule

module testmodule;

 reg [3:0] x; reg [3:0] y;
 reg carryin;
 wire carryout;
 wire [2:0] s;

 fs4bit fa1 (s,carryout,x,y,carryin);

 initial begin
  x = 4'b0000; y = 4'b0000;
 end
 
 initial begin
  $display("Teste de ALU - Eduardo Botelho de Andrade");
  $display("carryin      x         y  =  co  s");
  $monitor("    %b       %4b   %4b     %b %3b",carryin,x,y,carryout,s);

  #1 x = 4'b1010; y = 4'b0011;

 end

endmodule