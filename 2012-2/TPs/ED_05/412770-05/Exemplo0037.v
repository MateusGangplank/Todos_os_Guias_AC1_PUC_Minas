// -------------------------
// Exemplo0037 – Comparador
// Nome: Rayan Darwin
// Matricula: 412770
// ------------------------- 
 
module comparador (output s0, output s1, output s2, input [1:0] a, input [1:0] b);

        wire w0,w1,w2,w3,w4,w5,w6,w7,n1,n2,n3,n4,n5,n6;
        notgate NOT1(n1,a[1]);
        orgate OR1(w0,n1,b[1]);
        notgate NOT2(n2,a[0]);
        andgate3b AND1(w1,n2,b[0],w0);
        notgate NOT3(n3,a[1]);
        andgate AND2(w2,n3,b[1]);
        orgate OR2(s0,w1,w2);
        
        notgate NOT4(n4,b[1]);
        orgate OR3(w3,n4,a[1]);
        notgate NOT5(n5,b[0]);
        andgate3b AND3(w4,n5,a[0],w3);
        notgate NOT6(n6,b[1]);
        andgate AND4(w5,n6,a[1]);
        orgate OR4(s1,w4,w5);

        xnorgate XOR1(w6,a[1],b[1]);
        xnorgate XOR2(w7,a[0],b[0]);
        andgate AND5(s2,w6,w7);
		  
endmodule //comparador

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

module xnorgate (output s, input a, input b);
  assign s = ~(a ^ b);
endmodule

module orgate (output s, input a,  input b);
  assign s = a | b;
endmodule

module orgate3b (output s, input a, input b, input c);
  wire x;
  orgate OR1(x,a,b);
  orgate OR2(s,x,c);
endmodule

module teste_comparador;
// ------------------------- definir dados
      reg [1:0] x = 2'b00, y = 2'b00;
      wire s0,s1,s2;

      comparador comp(s0,s1,s2,x,y);

// ------------------------- parte principal 
 initial begin 
      $display("Exemplo0037 - Rayan Darwin - 412770");
      $display("Comparador\n");
		
      $monitor("%2b %2b -> maior=%1b maior=%1b igual=%1b",x,y,s1,s0,s2);
		
      #1 x=2'b00;    y = 2'b00;
      #1 x=2'b00;    y = 2'b01;
		#1 x=2'b10;    y = 2'b00;
      #1 x=2'b10;    y = 2'b11;
      #1 x=2'b11;    y = 2'b01;
      #1 x=2'b11;    y = 2'b10;
      #1 x=2'b01;    y = 2'b01;
      #1 x=2'b01;    y = 2'b10; 
 end
 
endmodule