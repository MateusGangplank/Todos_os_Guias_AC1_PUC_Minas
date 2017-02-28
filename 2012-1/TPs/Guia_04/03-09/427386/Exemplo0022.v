// -------------------------
// Exemplo0022 – FULL SUBTRACT
// Nome: André Henriques Fernandes
// Matricula: 427386
// ------------------------- 
 
// ------------------------- 
//  full Subtract
// ------------------------- 
module fullSubtract (output s1, output s0,
                               input a,  
                               input b,  
                               input ci);
   wire x,y,z,w1,w2;
   xorgate XOR1(x,a,b);
   notgate NOT1(w1,a);
   andgate AND1(y,w1,b);
   xorgate XOR2(s1,x,ci);
   notgate NOT2(w2,x);
   andgate AND2(z,w2,ci);
   orgate OR2(s0,z,y);



endmodule // fullSubtract

//module fullSubtract4 (output [3:0] s,
module fullSubtract4 (output [4:0] s,
                               input [3:0] a,
                               input [3:0] b);
   wire v1,v2,v3,v0,x;
   halfSubtract HS1(s[0],v0,a[0],b[0]);
   fullSubtract FS1(s[1],v1,a[1],b[1],v0);
   fullSubtract FS2(s[2],v2,a[2],b[2],v1);
   fullSubtract FS3(s[3],v3,a[3],b[3],v2);
   xorgate XOR1(x,s[3],v3);
//   conc C1(s[3],x);
   conc C1(s[4],x);

endmodule // fullSubtract4

module conc (output s, input a);

  assign s = a;

endmodule

module halfSubtract (output s0, output s1,
                               input a,
                               input b);
  wire x;
//  xorgate XOR1(s1,a,b);
  xorgate XOR1(s0,a,b);
  notgate NOT1(x,a);
//  andgate AND1(s0,x,b);
  andgate AND1(s1,x,b);

endmodule

module andgate (output s,
                               input a,
                               input b);
  assign s = a & b;
endmodule

module notgate (output s,
                               input a);
  assign s = ~a;
endmodule

module xorgate (output s,
                               input a,
                               input b);
  assign s = a ^ b;
endmodule
module orgate (output s,
                               input a,
                               input b);
  assign s = a | b;
endmodule

module test_fullSubtract;
// ------------------------- definir dados
      reg [3:0] x;
      reg [3:0] y;
//      wire [3:0] sub;
      wire [4:0] sub;

      fullSubtract4 FA41(sub,x,y);


// ------------------------- parte principal
 initial begin
      $display("Exemplo0022 - André Henriques Fernandes - 427386");
      $display("Test ALU’s full adder");

      #1 x=4'b0000; y=4'b0000;  // EXPERIMENTAR INSERIR ISSO

      $monitor("%4b %4b = %4b",x,y,sub);

      #1 x=4'b0110; y=4'b0100;

      #1 x=4'b0111; y=4'b0111;

      #1 x=4'b0101; y=4'b0111;

      #1 x=4'b0011; y=4'b0100;

      #1 x=4'b0100; y=4'b0010;
      
      // O bit do sinal está saindo com indefinido, nao entendi isso.
 
 end 
 
endmodule // test_fullAdder