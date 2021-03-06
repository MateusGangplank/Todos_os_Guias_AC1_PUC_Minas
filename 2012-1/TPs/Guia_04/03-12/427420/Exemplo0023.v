// -------------------------
// Exemplo0023 - COMPARADOR IGUALDADE
// Nome: Jenifer Henrique Moreira Borges
// Matricula: 427420
// ------------------------- 

// ------------------------- 

module comparaIgualdade (output [3:0] s, input [3:0] a, input [3:0] b);

   xnorgate XNOR1(s[0],a[0],b[0]);
   xnorgate XNOR2(s[1],a[1],b[1]);
   xnorgate XNOR3(s[2],a[2],b[2]);
   xnorgate XNOR4(s[3],a[3],b[3]);

endmodule

module xnorgate (output s, input a, input b);
  
  assign s = ~(a ^ b);

endmodule

module andgate (output s, input a, input b);

  assign s = a & b;

endmodule

module notgate (output s, input a);

  assign s = ~a;

endmodule

module xorgate (output s, input a, input b);

  assign s = a ^ b;

endmodule

module orgate (output s, input a, input b);
  
  assign s = a | b;

endmodule

module test_comp;
// ------------------------- definir dados 
      reg [3:0] x; 
      reg [3:0] y;
      wire [3:0] eq;

      comparaIgualdade COMP1(eq,x,y);

 
// ------------------------- parte principal 
 initial begin 
      $display("Exemplo0023 - Jenifer Henrique Moreira Borges - 427420");
      $display("Test ALU�s comparador igualdade"); 
		
		#1 x=4'b0000; y=4'b0000; 
      $monitor("%4b %4b = %4b",x,y,eq);      
      #1 x=4'b0110; y=4'b0100;
      #1 x=4'b0111; y=4'b0111;
      #1 x=4'b0101; y=4'b0111;
      #1 x=4'b0011; y=4'b0100;
      #1 x=4'b0100; y=4'b0010;
       
 end  
endmodule // test_fullAdder