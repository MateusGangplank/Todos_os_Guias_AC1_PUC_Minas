// -------------------------
// Exemplo0032 – Somador algebrico selecionavel
// Nome: Jenifer Henrique Moreira Borges
// Matricula: 427420
// ------------------------- 
 
//modulo fullAdder
module fullAdder (output s0, output carryOut, input a, input b,  input carryIn);

   wire x,y,z;
   xorgate XOR1(x,a,b);
   andgate AND1(y,a,b);
   xorgate XOR2(s0,x,carryIn);
   andgate AND2(z,x,carryIn);
   orgate OR2(carryOut,z,y);

endmodule // fullAdder

//modulo halfAdder
module halfAdder (output s0, output carryOut, input a, input b);

 xorgate XOR1(s0,a,b);
 andgate AND1(carryOut,a,b);  

endmodule // halfAdder

module somadorSelecionavel (output [3:0]s, output carryOut, input operador, input [3:0]a, input [3:0]b );
  wire w0, w1, w2, w3, c0, c1, c2;
  xorgate XOR0 ( w0, operador, b[0] );
  xorgate XOR1 ( w1, operador, b[1] );
  xorgate XOR2 ( w2, operador, b[2] );
  xorgate XOR3 ( w3, operador, b[3] );

  fullAdder FA0 ( s[0], c0, w0, a[0], operador);
  fullAdder FA1 ( s[1], c1, w1, a[1], c0);
  fullAdder FA2 ( s[2], c2, w2, a[2], c1);
  fullAdder FA3 ( s[3], carryOut, w3, a[3], c2);

endmodule

module verifZero(output s, input [3:0] a);
	norgate NORG (s,a[3:0]);
endmodule

module norgate (output s, input [3:0]a);
  assign s = ~(a[0] | a[1] | a[2] | a[3]);
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

module test_somadorSelecionavel;
// ------------------------- definir dados
      reg [3:0] x;
      reg [3:0] y;
      reg operador;
      wire [3:0] resultado;
      wire carryOut;
		wire q;

      somadorSelecionavel SS(resultado, carryOut, operador, x, y);
		verifZero teste(q, resultado);

// ------------------------- parte principal 
 initial begin 
      $display("Exemplo0032 - Jenifer Henrique Moreira Borges - 427420");
      $display("Somador selecionavel - 4bits com identificador de sinal 0\n");

      x=4'b0000; y=4'b0000; operador=1;
      $monitor("%4b   %4b   Op:%1b   Result:%4b   CarryOut:%1b   Verif:%1b",x,y,operador,resultado,carryOut,q);
      #1 x=4'b0101; y=4'b0111; operador=0;
      #1 x=4'b0011; y=4'b0100; operador=0;
      #1 x=4'b0110; y=4'b0100; operador=1;
      #1 x=4'b0111; y=4'b0111; operador=1;
      #1 x=4'b0100; y=4'b0010; operador=1;
 
 end
 
endmodule