// -----------------------
// Guia 01 - Exercicio 03
// Bruno César Lopes Silva
// Matrícula: 415985
// -----------------------

// --xnor gate--

module xnorgate (s, p, q, r, t);
 output s;                           // saida
 input p, q, r, t;                   // entradas

 assign s = ~(p ^ q ^ r ^ t);
 
 endmodule // xnorgate
 
// -- teste xnor gate --

module testexnorgate;
 reg p, q, r, t;
 wire s;
 
 xnorgate XNOR1 (s, p, q, r, t);
 
 initial begin
      $display ("Guia 01 - Exercicio 03");
		$display ("Bruno Cesar Lopes Silva - 415985");
		$display ("Teste Xnor Gate");
		$display ("\n~(p ^ q ^ r ^ t) = s\n");
		p=0; q=0; r=0; t=0;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", p, q, r, t, s);
      p=0; q=0; r=0; t=1;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", p, q, r, t, s);
      p=0; q=0; r=1; t=0;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", p, q, r, t, s);
      p=0; q=0; r=1; t=1;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", p, q, r, t, s);
      p=0; q=1; r=0; t=0;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", p, q, r, t, s);
      p=0; q=1; r=0; t=1;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", p, q, r, t, s);
      p=0; q=1; r=1; t=0;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", p, q, r, t, s);
      p=0; q=1; r=1; t=1;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", p, q, r, t, s);
      p=1; q=0; r=0; t=0;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", p, q, r, t, s);
      p=1; q=0; r=0; t=1;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", p, q, r, t, s);
      p=1; q=0; r=1; t=0;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", p, q, r, t, s);
      p=1; q=0; r=1; t=1;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", p, q, r, t, s);
      p=1; q=1; r=0; t=0;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", p, q, r, t, s);
      p=1; q=1; r=0; t=1;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", p, q, r, t, s);
      p=1; q=1; r=1; t=0;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", p, q, r, t, s);
      p=1; q=1; r=1; t=1;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", p, q, r, t, s);
 
 end
 
 endmodule // testexnorgate