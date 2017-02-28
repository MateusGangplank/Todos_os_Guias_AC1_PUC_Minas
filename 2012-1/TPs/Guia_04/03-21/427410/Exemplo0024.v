// -------------------------
// Exemplo0024 � COMPARADOR DIFERENCA
// Nome: Gustavo Barbosa
// Matricula: 427410


module comparaDiferenca (output [3:0] s, input [3:0] a, input [3:0] b);

   xorgate XOR1(s[0],a[0],b[0]);
   xorgate XOR2(s[1],a[1],b[1]);
   xorgate XOR3(s[2],a[2],b[2]);
   xorgate XOR4(s[3],a[3],b[3]);

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

module test_dif;
//definir dados
      reg [3:0] x; 
      reg [3:0] y;
      wire [3:0] eq;

      comparaDiferenca COMP1(eq,x,y);

 
//parte principal
 initial begin 
      $display("Exemplo0024 - Gustavo Barbosa - 427410");
      $display("Test ALU�s Comparador de diferenca"); 

      #1 x=4'b0000; y=4'b0000;  
		
      $monitor("%4b %4b = %4b",x,y,eq);
      
      #1 x=4'b0110; y=4'b0100;
      #1 x=4'b0111; y=4'b0111;
      #1 x=4'b0101; y=4'b0111;
      #1 x=4'b0011; y=4'b0100;
      #1 x=4'b0100; y=4'b0010;

 end 
 
endmodule