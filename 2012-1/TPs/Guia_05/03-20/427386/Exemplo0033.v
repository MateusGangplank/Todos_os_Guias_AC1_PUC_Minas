// -------------------------
// Exemplo0031 – FULL ADDER/SUBTRACTOR 
// Nome: André Henriques Fernandes
// Matricula: 427386
// ------------------------- 
 
// ------------------------- 
//   
// ------------------------- 

module incremento (output [3:0] s, output ovfl,
                                input [3:0] a);

        wire w0,w1,w2,w3,w4,n1,n2,n3;
        
        norgate NOR1(w0,a[0],a[1]);
        notgate NOT1(n1,a[2]);
        orgate OR1(w1,w0,n1);
        andgate AND1(s[3],w1,a[3]);

        xorgate XOR1(w2,a[0],a[2]);
        andgate AND2(w3,w2,a[1]);
        notgate NOT2(n2,a[1]);
        andgate AND3(w4,a[2],n2);
        orgate OR2(s[2],w4,w3);

        xorgate XOR2(s[1],a[0],a[1]);

        notgate NOT3(s[0],a[0]);

        andgate3 AND4(ovfl,a[2],a[1],a[0]);


endmodule // fullAdder

module andgate (output s,
                               input a,  
                               input b);
  assign s = a & b;
endmodule

module andgate3 (output s,
                               input a,
                               input b,
                               input c);
  wire x;
  andgate AND1(x,a,b);
  andgate AND2(s,x,c);
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

      incremento INC1(result,ovfl,x);


// ------------------------- parte principal
 initial begin
      $display("Exemplo0021 - André Henriques Fernandes - 427386");
      $display("Test ALU’s full adder");

      $monitor("%4b + 1 = %4b Overflow = %1b",x,result,ovfl);

      #1 x=4'b0110;

      #1 x=4'b0111;

      #1 x=4'b0101;

      #1 x=4'b0011;

      #1 x=4'b0100;


 end
 
endmodule // test_fullAdder