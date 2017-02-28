// -------------------------
// Exemplo0031 � FULL ADDER/SUBTRACTOR 
// Nome: Andr� Henriques Fernandes
// Matricula: 427386
// ------------------------- 
 
// ------------------------- 
//   
// ------------------------- 

module decremento (output [3:0] s, output ovfl,
                                   input [3:0] a);

        wire w0,w1,w2,w3,w4,w5,n1,n2,n3;
        orgate3 OR1(w0,a[0],a[1],a[2]);
        andgate AND1(w1,w0,a[3]);
        norgate4 NOR1(w2,a[0],a[1],a[2],a[3]);
        orgate OR2(s[3],w2,w1);

        orgate OR3(w3,a[0],a[1]);
        andgate AND2(w4,w3,a[2]);
        norgate3 NOR2(w5,a[0],a[1],a[2]);
        orgate OR4(s[2],w4,w5);

        xorgate XOR1(s[1],a[0],a[1]);

        notgate NOT1(s[0],a[0]);

        notgate NOT2(n1,a[3]);
        norgate4 NOR3(ovfl,a[2],a[1],a[0],n1);


endmodule // fullAdder

module andgate (output s,
                               input a,  
                               input b);
  assign s = a & b;
endmodule

module norgate4 (output s,
                               input a,
                               input b,
                               input c,
                               input d);
  wire x,y;
  norgate NOR1(x,a,b);
  norgate NOR2(y,x,c);
  norgate NOR3(s,y,d);
endmodule

module norgate3 (output s,
                               input a,
                               input b,
                               input c);
  wire x;
  norgate NOR1(x,a,b);
  norgate NOR2(s,x,c);
endmodule

module orgate3 (output s,
                               input a,
                               input b,
                               input c);
  wire x;
  orgate OR1(x,a,b);
  orgate OR2(s,x,c);
endmodule

module norgate (output s,
                               input a,  
                               input b);
  assign s = ~(a|b);
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

module test_fullAdder;
// ------------------------- definir dados
      reg [3:0] x = 4'b0000;
      wire ovfl;
      wire [3:0] result;

      decremento DEC1(result,ovfl,x);


// ------------------------- parte principal
 initial begin
      $display("Exemplo0021 - Andr� Henriques Fernandes - 427386");
      $display("Test ALU�s full adder");

      $monitor("%4b - 1 = %4b Overflow = %1b",x,result,ovfl);

      #1 x=4'b0110;

      #1 x=4'b0111;

      #1 x=4'b1000;

      #1 x=4'b0101;

      #1 x=4'b0011;

      #1 x=4'b0100;


 end
 
endmodule // test_fullAdder