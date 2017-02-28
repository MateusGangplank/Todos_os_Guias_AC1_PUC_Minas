// -------------------------
// Exemplo0031 – Somador algebrico selecionavel
// Nome: Roger Rubens Machado
// Matricula: 430533
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

// half adder 	
module halfAdder( s0, carry_out, a, b);
	input a, b;
	output s0, carry_out;
	
	xor XOR1(s0, a, b);
	and AND1(carry_out, a, b);
endmodule // halfAdder

// full adder 3 bits	
module fullAdder3 (output [2:0]s, input [2:0]a, input [2:0]b); 
	wire vaiUm;
	wire vaiUm1;
	wire carry_out;
	
	halfAdder ha1(s[0], vaiUm, a[0], b[0]);
	fullAdder ha2(s[1], vaiUm1, a[1], b[1], vaiUm);
	fullAdder ha3(s[2], carry_out, a[2], b[2], vaiUm1);	
endmodule // fullAdder 

module somadorSelecionavel (output [2:0]s, output carryOut, input operador, input [2:0]a, input [2:0]b );
  wire w0, w1, w2, c0, c1, c2;
  xorgate XOR0 ( w0, operador, b[0] );
  xorgate XOR1 ( w1, operador, b[1] );
  xorgate XOR2 ( w2, operador, b[2] );
  xorgate XOR3 (carryOut, c2, operador);

  fullAdder FA0 ( s[0], c0, w0, a[0], operador);
  fullAdder FA1 ( s[1], c1, w1, a[1], c0);
  fullAdder FA2 ( s[2], c2, w2, a[2], c1);
endmodule // somadorSelecionavel

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
      reg [2:0] x;
      reg [2:0] y;
      reg operador;
      wire [2:0] resultado;
      wire carryOut;

      somadorSelecionavel SS(resultado, carryOut, operador, x, y);
		
// ------------------------- parte principal 
 initial begin 
      $display("Exemplo0031 - Roger Rubens Machado - 430533");
      $display("Somador selecionavel - 3bits\n");

      x=3'b000; y=3'b000; operador=1'b0;
      $monitor("%3b   %3b   Op:%1b   Resultado:   %3b   CarryOut: ",x,y,operador,resultado,carryOut);
      #1 x=3'b010; y=3'b011; operador=0;
      #1 x=3'b001; y=3'b010; operador=0;
      #1 x=3'b011; y=3'b010; operador=1;
      #1 x=3'b011; y=3'b011; operador=1;
      #1 x=3'b010; y=3'b001; operador=1;
 
 end
 
endmodule