//ARQ1 - Eduardo Botelho de Andrade - 427395

module fa (output s, output cout, input a, input b, input cin);
   wire w1,w2,w3,w4;
       xor xor1 (w1,a,b);
       xor xor2 (s,c,w1);
       and and1 (w3,a,b);
       and and2 (w4,c,w1);
         or or1 (cout, w3,w4);

endmodule


module fullAdder (output [5:0] s,
                     output cout,
                   input [5:0] a,
                   input [5:0] b,
                   input carryIn);

     reg cin;
     wire w1,w2,w3,w4,w5,w6,w7,w8;

     fa fa1(s[0],w1,a[0],b[0],cin);
     fa fa2(s[1],w2,a[1],b[1],w1);
     fa fa3(s[2],w3,a[2],b[2],w2);
     fa fa4(s[3],w4,a[3],b[3],w3);
     fa fa5(s[4],w5,a[4],b[4],w4);
     fa fa6(s[5],w6,a[5],b[5],w5);


endmodule

module fs (output s, output bout, input a, input b, input bin);
   wire w1,w2,w3,w4,w5,w6;
      
      xor xor1 (w1, a,b);
      not not1 (w2,a);
      and and1 (w3,w2,b);
      xor xor2 (s,w1,bin);
      not not2 (w5, w1);
      and and2 (w6,w5,bin);
      or   or1 (bout,w6,w3);

endmodule

module fullSubtractor(output [5:0] s,
                      output bout,
                      input [5:0] a,
                      input [5:0] b,
                      input bin);
   wire w1,w2,w3,w4,w5;

       fs fs1 (s[5],w1,a[5],b[5],bin);
       fs fs2 (s[4],w2,a[4],b[4],w1);
       fs fs3 (s[3],w3,a[3],b[3],w2);
       fs fs4 (s[2],w4,a[2],b[2],w3);
       fs fs5 (s[1],w5,a[1],b[1],w4);
       fs fs6 (s[0],bout,a[0],b[0],w5);

endmodule

module testAlu;
  reg [5:0] a;
  reg [5:0] b;
  reg bin;
  wire [5:0] s;
  wire bout;

  fullSubtractor fs (s,bout,a,b,bin);

  initial begin
   a=6'b000000; b=6'b000000; bin = 1'b0;
  end

  initial begin
    $display("Teste ALU - Eduardo Botelho");
    $display("s   borrow-out   a   b    borrow-in");
    $monitor("%b %b %b %b %b",s,bout,a,b,bin);

    #1 a=6'b000001;
    #1 a=6'b000011; b=6'b000001;
    #1 a=6'b000000; b=6'b001110;

  end
endmodule