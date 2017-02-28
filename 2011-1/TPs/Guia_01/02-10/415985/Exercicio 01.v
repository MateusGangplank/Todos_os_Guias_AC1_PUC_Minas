// -----------------------
// Guia 01 - Exercicio 01
// Bruno César Lopes Silva
// Matrícula: 415985
// -----------------------

// --nand gate--

module nandgate (s, p, q, r);
 output s;
 input p, q, r;

 assign s = ~(p & q & r);
 
 endmodule // nandgate
 
// -- teste nand gate --

module testenandgate;
 reg p, q, r;
 wire s;
 
 nandgate NAND1 (s, p, q, r);
 
 initial begin
      $display ("Guia 01 - Exercicio 01");
		$display ("Bruno Cesar Lopes Silva - 415985");
		$display ("Teste Nand Gate");
		$display ("\n~(p & q & r) = s\n");
		p=0; q=0; r=0;
  #1  $display("~(%b & %b & %b) = %b", p, q, r, s);
      p=0; q=0; r=1;
  #1  $display("~(%b & %b & %b) = %b", p, q, r, s);
      p=0; q=1; r=0;
  #1  $display("~(%b & %b & %b) = %b", p, q, r, s);
      p=0; q=1; r=1;
  #1  $display("~(%b & %b & %b) = %b", p, q, r, s);
      p=1; q=0; r=0;
  #1  $display("~(%b & %b & %b) = %b", p, q, r, s);
      p=1; q=0; r=1;
  #1  $display("~(%b & %b & %b) = %b", p, q, r, s);
      p=1; q=1; r=0;
  #1  $display("~(%b & %b & %b) = %b", p, q, r, s);
      p=1; q=1; r=1;
  #1  $display("~(%b & %b & %b) = %b", p, q, r, s);
 end
 
 endmodule // testenandgate
 
 // OBS.: NAO DEIXAR ESPACOS EM BRANCO NO NOME DO ARQUIVO.
  

