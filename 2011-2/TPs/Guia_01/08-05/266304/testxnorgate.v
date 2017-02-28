//------------------------------------------------------
//-- Exercicio 3 - XNOR
//-- NOME: Afonso de Souza Spinelli
//-- MATRICULA: 266304
//-- DATA: 03/08/2011
//------------------------------------------------------
//---------------------------------------------------------------------
//--02.) Construir a tabela_verdade para a porta XNOR  com 2 entradas.
//--     Obs.: Usar operador ( ~(a^b) ) na definicao do modulo.
//---------------------------------------------------------------------

// ---------------------
// -- xnor gate
// ---------------------
module xnorgate ( output s,
                  input a, 
                  input b);

  assign s = ~(a^b);

endmodule // xnorgate

// ---------------------
// -- test xnor gate
// ---------------------
module testxnorgate;
// ---------------------- dados locais
   reg a, b; // definir registradores
   wire s;   // definir conexao (fio)

// ------------------------- instancia
   xnorgate XNOR1(s, a, b);

// ------------------------- preparacao
   initial begin:start
           a=0; b=0;
   end

// ------------------------- parte principal
   initial begin
           $display("Exercicio 3 - Afonso Spinelli - 266304");
           $display("Tabela Verdade para porta XNOR - v1.0\n");
           $display ("~(a ^ b) = s\n");
           
   #1	   $display ("~(%b ^ %b) = %b", a, b, s);
           a = 0; b = 1;
   #1	   $display ("~(%b ^ %b) = %b", a, b, s);
           a = 1; b = 0;
   #1      $display ("~(%b ^ %b) = %b", a, b, s);
           a = 1; b = 1;
   #1	   $display ("~(%b ^ %b) = %b", a, b, s);
   end

endmodule // testxnorgate
