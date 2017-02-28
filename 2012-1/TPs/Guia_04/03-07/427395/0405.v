//Guia04 - ARQ1 - Eduardo Botelho de Andrade

`include "fa.v"

module twocomplement (output [3:0] s,
                      output carryout,
                      input [3:0] a);

//complemento de 1
  not not1 (w0,a[0]);
  not not2 (w1,a[1]);
  not not3 (w2,a[2]);
  not not4 (w3,a[3]);
//complemento de 2
  fa fa1 (s[0],c1,a[0],1,0);
  fa fa2 (s[1],c2,a[1],0,c1);
  fa fa3 (s[2],c3,a[2],0,c2);
  fa fa4 (s[3],carryout,a[3],0,c3);


endmodule

module testmodule;

 reg [3:0] x;
 wire [3:0] s;
 wire carryout;

 twocomplement twocomplement1 (s,carryout,x);

 initial begin
  x = 4'b0000;
 end
 
 initial begin
  $display("Teste de ALU - Eduardo Botelho de Andrade");
  $display("   x      C2(x)");
  $monitor("%4b  %b%b",x,carryout,s);

  #1 x = 4'b1010;

 end

endmodule