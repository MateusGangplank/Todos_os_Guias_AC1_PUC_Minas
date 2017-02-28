//Guia04 - ARQ1 - Eduardo Botelho de Andrade

module different (output s,
                  input [3:0] a,
                  input [3:0] b);

  xor xor1 (w1,a[0],b[0]);
  xor xor2 (w2,a[1],b[1]);
  xor xor3 (w3,a[2],b[2]);
  xor xor4 (w4,a[3],b[3]);
  or   or1 (s,w1,w2,w3,w4);


endmodule

module testmodule;

 reg [3:0] x; reg [3:0] y;
 wire s;

 different different1 (s,x,y);

 initial begin
  x = 4'b0000; y = 4'b0000;
 end
 
 initial begin
  $display("Teste de ALU - Eduardo Botelho de Andrade");
  $display("   x      y      s");
  $monitor("%4b %4b  %b",x,y,s);

  #1 x = 4'b1010; y = 4'b0011;

 end

endmodule