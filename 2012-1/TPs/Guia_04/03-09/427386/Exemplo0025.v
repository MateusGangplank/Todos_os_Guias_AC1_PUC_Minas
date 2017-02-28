// -------------------------
// Exemplo0025 –
// Nome: André Henriques Fernandes
// Matricula: 427386
// ------------------------- 
 
// ------------------------- 
//
// ------------------------- 

module halfAdder (output s0, output s1,
                               input a,  
                               input b);
//  xorgate XOR1(s1,a,b);
//  andgate AND1(s0,a,b);
  xorgate XOR1(s0,a,b);
  andgate AND1(s1,a,b);

endmodule

module comple2 (output [3:0] s,
                               input [3:0] a);
  wire v0,v1,v2,v3;
  wire [3:0] x;
  notgate NOT1(x,a);
  halfAdder HA1(s[0],v0,1,x[0]);
  halfAdder HA2(s[1],v1,v0,x[1]);
  halfAdder HA3(s[2],v2,v1,x[2]);
  halfAdder HA4(s[3],v3,v2,x[3]);

endmodule

module andgate (output s,
                               input a,  
                               input b);
  assign s = a & b;
endmodule

module xorgate (output s,
                               input a,
                               input b);
  assign s = a ^ b;
endmodule
module notgate (output [3:0] s,
                               input [3:0] a);
  assign s = ~a;
endmodule

module test_fullAdder; 
// ------------------------- definir dados 
      reg [3:0] x;
      wire [3:0] c2;

      comple2 C21(c2,x);

 
// ------------------------- parte principal 
 initial begin 
      $display("Exemplo0025 - André Henriques Fernandes - 427386");
      $display("Test AL’s C2");
      #1 x=4'b0001;
      $monitor("C2(%4b) = %4b",x,c2);
      
      #1 x=4'b0110;

      #1 x=4'b0111;

      #1 x=4'b0101;

      #1 x=4'b0011;

      #1 x=4'b0100;
      
      //Theldo, estou com dificuldade de passar meus circuitos para verilog, os circuitos estão certos, 
      //todos testados, mas em verilog não dá certo.
 
 end 
 
endmodule // test_fullAdder



