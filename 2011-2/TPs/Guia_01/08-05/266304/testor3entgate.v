//------------------------------------------------------
//-- Exercicio 5 - OR
//-- NOME: Afonso de Souza Spinelli
//-- MATRICULA: 266304
//-- DATA: 03/08/2011
//------------------------------------------------------
//---------------------------------------------------------------------
//--01.) Construir a tabela-verdade para a porta OR com 3 entradas.
//--     Obs.: Usar na definicao do modulo a propriedade de Morgan.
//---------------------------------------------------------------------

// ---------------------
// -- or gate
// ---------------------
module or3gate ( output s,
                  input a,
                  input b,
                  input c);

  assign s = (a|b|c);

endmodule // or3gate

// ---------------------
// -- test or3 gate
// ---------------------
module testor3entgate;
// ---------------------- dados locais
   reg a, b, c; // definir registradores
   wire s;   // definir conexao (fio)

// ------------------------- instancia
   or3gate OR1(s, a, b, c);

// ------------------------- preparacao
   initial begin:start
           a=0; b=0; c=0;
   end

// ------------------------- parte principal
   initial begin
           $display("Exercicio 4 - Afonso Spinelli - 266304");
           $display("Tabela Verdade para porta OR com 3 entradas - v1.0\n");
           $display ("(a | b | c) = s\n");

   #1	   $display ("(%b | %b | %b) = %b", a, b, c, s);
           a = 0; b = 0; c = 1;
   #1	   $display ("(%b | %b | %b) = %b", a, b, c, s);
           a = 0; b = 1; c = 0;
   #1      $display ("(%b | %b | %b) = %b", a, b, c, s);
           a = 0; b = 1; c = 1;
   #1	   $display ("(%b | %b | %b) = %b", a, b, c, s);
           a = 1; b = 0; c = 0;
   #1      $display ("(%b | %b | %b) = %b", a, b, c, s);
           a = 1; b = 0; c = 1;
   #1      $display ("(%b | %b | %b) = %b", a, b, c, s);
           a = 1; b = 1; c = 0;
   #1      $display ("(%b | %b | %b) = %b", a, b, c, s);
           a = 1; b = 1; c = 1;
   #1      $display ("(%b | %b | %b) = %b", a, b, c, s);
   end

endmodule // testor3entgate