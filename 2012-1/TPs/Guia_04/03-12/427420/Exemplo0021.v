// -------------------------
// Exemplo0021 – FULL ADDER 
// Nome: Jenifer Henrique Moreira Borges
// Matricula: 427420
// ------------------------- 
 
// ------------------------- 
//  full adder 
// ------------------------- 
module fullAdder (output s1, output s0, input a, input b,  input ci);
      
   wire x,y,z;
   xorgate XOR1(x,a,b);
   andgate AND1(y,a,b);
   xorgate XOR2(s1,x,ci);
   andgate AND2(z,x,ci);
   orgate OR2(s0,z,y);

endmodule // fullAdder

module fullAdder4 (output [4:0] s, input [3:0] a, input [3:0] b);                               
                               
   wire v1,v2,v3,v0;
   halfAdder HA1(s[0],v0,a[0],b[0]);
   fullAdder FA1(s[1],v1,a[1],b[1],v0);
   fullAdder FA2(s[2],v2,a[2],b[2],v1);
   fullAdder FA3(s[3],v3,a[3],b[3],v2);
   conc C1(s[4],v3);

endmodule // fullAdder

module conc (output s, input a);

  assign s = a;

endmodule

module halfAdder (output s0, output s1, input a, input b);
 xorgate XOR1(s1,a,b);     
 andgate AND1(s0,a,b);


endmodule

module andgate (output s, input a, input b);
  assign s = a & b;
endmodule

module xorgate (output s, input a, input b);
  assign s = a ^ b;
endmodule

module orgate (output s, input a,  input b);
  assign s = a | b;
endmodule

module test_fullAdder; 
// ------------------------- definir dados
      reg [3:0] x; 
      reg [3:0] y;
      wire [4:0] soma;
      
      fullAdder4 FA41(soma,x,y);

 
// ------------------------- parte principal 
 initial begin 
      $display("Exemplo0021 - Jenifer Henrique Moreira Borges - 427420");
      $display("Test ALU’s full adder"); 
      
      x=4'b0000; y=4'b0000; 
      $monitor("%4b %4b = %4b",x,y,soma);
      #1 x=4'b0101; y=4'b0111;
      #1 x=4'b0011; y=4'b0100;
      #1 x=4'b0110; y=4'b0100;
      #1 x=4'b0111; y=4'b0111;
      #1 x=4'b0100; y=4'b0010;
 
 end 
 
endmodule // test_fullAdder