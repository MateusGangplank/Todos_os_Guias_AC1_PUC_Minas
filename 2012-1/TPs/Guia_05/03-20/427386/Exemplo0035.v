// -------------------------
// Exemplo0031 � FULL ADDER/SUBTRACTOR 
// Nome: Andr� Henriques Fernandes
// Matricula: 427386
// ------------------------- 
 
// ------------------------- 
//   
// ------------------------- 

module comparador (output s0, output s1, output s2, input [1:0] a, input [1:0] b);

        wire w0,w1,w2,w3,w4,n1,n2,n3;
        notgate NOT1(a[1],n1);
        orgate OR1(w0,n1,b[1]);
        notgate NOT2(n2,a[0]);
        andgate3 AND1(w1,n2,b[0],w0);
        notgate NOT3(n3,a[1]);
        andgate AND2(w2,n3,b[1]);
        orgate OR2(s0,w1,w2);
        
        notgate NOT4(b[1],n1);
        orgate OR3(w0,n1,a[1]);
        notgate NOT5(n2,b[0]);
        andgate3 AND3(w1,n2,a[0],w0);
        notgate NOT6(n3,b[1]);
        andgate AND4(w2,n3,a[1]);
        orgate OR4(s1,w1,w2);

        xorgate XOR1(w3,a[1],b[1]);
        xorgate XOR2(w4,a[0],b[0]);
        andgate AND5(s2,w3,w4);





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
      reg [1:0] x = 2'b00, y = 2'b00;
      wire s0,s1,s2;

      comparador COMP1(s0,s1,s2,x,y);


// ------------------------- parte principal
 initial begin
      $display("Exemplo0021 - Andr� Henriques Fernandes - 427386");
      $display("Test ALU�s full adder");

      $monitor("%2b %2b -> maior=%1b menor=%1b igual=%1b",x,y,s0,s1,s2);

      #1 x=2'b00;    y = 2'b00;

      #1 x=2'b00;    y = 2'b01;

      #1 x=2'b01;    y = 2'b01;

      #1 x=2'b01;    y = 2'b10;

      #1 x=2'b10;    y = 2'b00;

      #1 x=2'b10;    y = 2'b11;

      #1 x=2'b11;    y = 2'b01;

      #1 x=2'b11;    y = 2'b10;


 end
 
endmodule // test_fullAdder

// OBS.: EXPERIMENTE USAR APENAS DEFINICOES DE PORTAS