//ARQ1 - Eduardo Botelho de Andrade - 427395

module equals (output s,
               input [5:0] a,
               input [5:0] b);

   wire w1,w2,w3,w4,w5,w6;

   xor xor1 (w1,a[5],b[5]);
   xor xor2 (w2,a[4],b[4]);
   xor xor3 (w3,a[3],b[3]);
   xor xor4 (w4,a[2],b[2]);
   xor xor5 (w5,a[1],b[1]);
   xor xor6 (w6,a[0],b[0]);
   nor nor1 (s,w1,w2,w3,w4,w5,w6);

endmodule

module testAlu;
  reg [5:0] a;
  reg [5:0] b;
  wire s;

  equals eq1 (s,a,b);

  initial begin
   a=6'b000000; b=6'b000000;
  end

  initial begin
    $display("Teste ALU - Eduardo Botelho");
    $display("s        a         b");
    $monitor("%b %b %b",s,a,b);

    #1 a=6'b000001;
    #1 a=6'b000011; b=6'b000001;
    #1 a=6'b000000; b=6'b001110;

  end
endmodule