// -----------------------
// Guia 01 - Exercicio 02
// Bruno César Lopes Silva
// Matrícula: 415985
// -----------------------

// --nor gate--

module norgate (s, p, q, r);
 output s;
 input p, q, r;

 assign s = ~(p | q | r);
 
 endmodule // norgate
 
// -- teste nor gate --

module testenorgate;
 reg p, q, r;
 wire s;
 
 norgate NOR1 (s, p, q, r);
 
 initial begin
      $display ("Guia 01 - Exercicio 02");
		$display ("Bruno Cesar Lopes Silva - 415985");
		$display ("Teste Nor Gate");
		$display ("\n~(p | q | r) = s\n");
		p=0; q=0; r=0;
  #1  $display("~(%b | %b | %b) = %b", p, q, r, s);
      p=0; q=0; r=1;
  #1  $display("~(%b | %b | %b) = %b", p, q, r, s);
      p=0; q=1; r=0;
  #1  $display("~(%b | %b | %b) = %b", p, q, r, s);
      p=0; q=1; r=1;
  #1  $display("~(%b | %b | %b) = %b", p, q, r, s);
      p=1; q=0; r=0;
  #1  $display("~(%b | %b | %b) = %b", p, q, r, s);
      p=1; q=0; r=1;
  #1  $display("~(%b | %b | %b) = %b", p, q, r, s);
      p=1; q=1; r=0;
  #1  $display("~(%b | %b | %b) = %b", p, q, r, s);
      p=1; q=1; r=1;
  #1  $display("~(%b | %b | %b) = %b", p, q, r, s);
 end
 
 endmodule // testenorgate