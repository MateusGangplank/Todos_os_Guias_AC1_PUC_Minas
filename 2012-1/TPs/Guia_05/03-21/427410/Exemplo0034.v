// -------------------------
//  Exemplo0034
// Nome: Gustavo Barbosa
// Matricula: 427410
// -------------------------


//Decremento de 1
module decremento (output [3:0] s, output ovfl, input [3:0] a);

        wire w0,w1,w2,w3,w4,w5,n1,n2,n3;
        orgate3b OR1(w0,a[0],a[1],a[2]);
        andgate AND1(w1,w0,a[3]);
        norgate4b NOR1(w2,a[0],a[1],a[2],a[3]);
        orgate OR2(s[3],w2,w1);

        orgate OR3(w3,a[0],a[1]);
        andgate AND2(w4,w3,a[2]);
        norgate3b NOR2(w5,a[0],a[1],a[2]);
        orgate OR4(s[2],w4,w5);

        xorgate XOR1(s[1],a[0],a[1]);

        notgate NOT1(s[0],a[0]);

        notgate NOT2(n1,a[3]);
        norgate4b NOR3(ovfl,a[2],a[1],a[0],n1);

endmodule


module norgate (output s,input a, input b);
  assign s = ~(a|b);
endmodule

module norgate3b (output s, input a, input b, input c);
  wire x;
  norgate NOR1(x,a,b);
  norgate NOR2(s,x,c);
endmodule

module norgate4b (output s,input a,input b,input c,input d);

  wire x,y;
  norgate NOR1(x,a,b);
  norgate NOR2(y,x,c);
  norgate NOR3(s,y,d);
endmodule


module notgate (output s,input a);
  assign s = ~a;
endmodule

module andgate3b (output s,input a,input b,input c);
  wire x;
  andgate AND1(x,a,b);
  andgate AND2(s,x,c);
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

module orgate3b (output s, input a, input b, input c);
  wire x;
  orgate OR1(x,a,b);
  orgate OR2(s,x,c);
endmodule

module teste_decremento;
//definir dados
      reg [3:0] x = 4'b0000;
      wire overFlow;
      wire [3:0] result;

      decremento DEC1(result,overFlow,x);

// parte principal
 initial begin 
       $display("Exemplo0034 - Gustavo Barbosa - 427410");
      $display("Decremento de 1\n");

      $monitor("%4b - 1 = %4b Overflow = %1b",x,result,overFlow);
      #1 x=4'b0110;
      #1 x=4'b0111;
      #1 x=4'b1000;
      #1 x=4'b0101;
      #1 x=4'b0011;
      #1 x=4'b0100;
 
 end
 
endmodule