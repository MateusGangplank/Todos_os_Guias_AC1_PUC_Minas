// -----------------------
// Guia 01 - Exercicio 05
// Bruno César Lopes Silva
// Matrícula: 415985
// -----------------------

// --xor gate--

module xorgate (s, p, q);
 output s;
 input p, q;

 assign s = (((~p) & q) | (p & (~q)));
 
 endmodule // xorgate
 
// -- teste xor gate --

module testexorgate;
 reg p, q;
 wire s;
 
 xorgate XOR1 (s, p, q);
 
 initial begin
      $display ("Guia 01 - Exercicio 05");
		$display ("Bruno Cesar Lopes Silva - 415985");
		$display ("Teste Xor Gate");
		$display ("\n(~p & q | p & ~q) = s\n");
		p=0; q=0;
  #1  $display("(%b ^ %b) = %b", p, q, s);
      p=0; q=1;
  #1  $display("(%b ^ %b) = %b", p, q, s);
      p=1; q=0;
  #1  $display("(%b ^ %b) = %b", p, q, s);
      p=1; q=1;
  #1  $display("(%b ^ %b) = %b", p, q, s);
 
 end
 
 endmodule // testexorgate