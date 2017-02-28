// ------------------------- 
//--userConstruir a tabela_verdade para a porta XNOR com 2 entradas. 
//--Obs.: Usar a expressão: a b+a'b' na definição do módulo.       
//----------------------------- 
// Exercicio07 - XNOR 
// Nome: Milton costa teles da silva
// Matricula: 002751

// ---------------------
// -- xnor gate
// ---------------------

module xnorgate (s, p, q );
 output s;
 input  p, q;

 assign s = ( p&q | ~p&~q );

endmodule // xnorgate

// ---------------------
// -- test xnor gate
// ---------------------

module testxnorgate;
 reg   a, b;
 wire  s;
          // instancia
 xnorgate XNOR1 (s, a, b  );
 
//----------// parte principal
 initial begin
      $display("Exercicio07 -  Milton teles da silva - 002751");
      $display("Test xnor gate");
      $display("\na ~^ b  = s\n");
      a=0; b=0;
      $monitor("%b ~^ %b  = %b", a , b , s);
   #1 a=0; b=1;
   #1 a=1; b=0;
   #1 a=1; b=1;
 end
endmodule // testnandgate
