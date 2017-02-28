// ------------------------- 
//--Construir a tabela_verdade para a porta NAND com 2 entradas. 
//--Obs.: Usar na definição do módulo a propriedade de Morgan.       
//----------------------------- 
// Exercicio04 - NAND
// Nome: Milton costa teles da silva
// Matricula: 002751
// ---------------------
// -- nand gate
// ---------------------

module nandgate (output s, input p, input q );
 assign s = ( ~p | ~q );

endmodule // nandgate

// ---------------------
// -- test nand gate
// ---------------------

module testnandgate;
 reg   a, b;
 wire  s;
          // instancia
 nandgate NAND1 (s, a, b);
 
//------------parte principal
 initial begin
      $display("Exercicio04 -  Milton teles da silva - 002751");
      $display("Test NAND gate");
      $display("\na ~& b  = s\n");
      a=0; b=0;
  #1  $display("%b ~& %b  = %b", a , b , s);
      a=0; b=1;
  #1  $display("%b ~& %b  = %b", a , b , s);
      a=1; b=0;
  #1  $display("%b ~& %b  = %b", a , b , s);
      a=1; b=1;
  #1  $display("%b ~& %b  = %b", a , b , s);

 end
endmodule // testnandgate
