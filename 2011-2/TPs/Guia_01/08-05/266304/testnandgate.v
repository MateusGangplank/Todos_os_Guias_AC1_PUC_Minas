//------------------------------------------------------
//-- Exercicio 1 - NAND
//-- NOME: Afonso de Souza Spinelli
//-- MATRICULA: 266304
//-- DATA: 03/08/2011
//------------------------------------------------------
//---------------------------------------------------------------------
//--01.) Construir a tabela-verdade para a porta NAND com 2 entradas.
//--     Obs.: Usar operador ( ~(a&b) ) na definicao do modulo.
//--     Usar $display().
//---------------------------------------------------------------------

// ---------------------
// -- nand gate
// ---------------------
module nandgate ( output s,
                  input a, 
                  input b);

  assign s = ~(a&b);

endmodule // nandgate

// ---------------------
// -- test nand gate
// ---------------------
module testnandgate;
// ---------------------- dados locais
   reg a, b; // definir registradores
   wire s;   // definir conexao (fio)

// ------------------------- instancia
   nandgate NAND1(s, a, b);

// ------------------------- preparacao
   initial begin:start
           a=0; b=0;
   end

// ------------------------- parte principal
   initial begin
           $display("Exercicio 1 - Afonso Spinelli - 266304");
           $display("Tabela Verdade para porta NAND - v1.0\n");
           $display ("~(a & b) = s\n");
           //a = 0; b = 0;
   #1	   $display ("~(%b & %b) = %b", a, b, s);
           a = 0; b = 1;
   #1	   $display ("~(%b & %b) = %b", a, b, s);
           a = 1; b = 0;
   #1      $display ("~(%b & %b) = %b", a, b, s);
           a = 1; b = 1;
   #1	   $display ("~(%b & %b) = %b", a, b, s);
   end
    
endmodule // testnandgate
