 
// ------------------------- 
// Exemplo0009 - AND
// Nome: Ederson Cristiano Nunes 
// Matricula: 438964
// Versao: 0.9
// ------------------------- 
 
// -------------------------
// -- and gate
// -------------------------
module andgate ( output s,
                          input o,
								  input p,
                          input q);
 assign s = (~(~o | ~p | ~q));
endmodule // andgate
// ---------------------
// -- test and gate
// ---------------------
module testandgate;
// ------------------------- dados locais
   reg a, b, c; // definir registradores
   wire s; // definir conexao (fio)
// ------------------------- instancia
   andgate AND1 (s, a, b, c);
// ------------------------- preparacao
   initial begin:start
      a=0; b=0; c=0;
   end
// ------------------------- parte principal
   initial begin
     $display("Exemplo0009 - Ederson Cristiano - 438964");
     $display("Test AND gate");
     $display("\na & b & c = s\n");
     a=0; b=0; c=0;
  #1 $display("%b & %b & %b = %b", a, b, c, s);
     a=0; b=0; c=1;
  #1 $display("%b & %b & %b = %b", a, b, c, s);
     a=0; b=1; c=0;
  #1 $display("%b & %b & %b = %b", a, b, c, s);
     a=0; b=1; c=1;
  #1 $display("%b & %b & %b = %b", a, b, c, s);
     a=1; b=0; c=0;
  #1 $display("%b & %b & %b = %b", a, b, c, s);
     a=1; b=0; c=1;
  #1 $display("%b & %b & %b = %b", a, b, c, s);
     a=1; b=1; c=0;
  #1 $display("%b & %b & %b = %b", a, b, c, s);
     a=1; b=1; c=1;
  #1 $display("%b & %b & %b = %b", a, b, c, s);
 end
endmodule // testandgate

// ----------------------------------- 
// Exemplo0009 - Ederson Cristiano - 438964
    // Test AND gate
    
    // a & b & c = s
    
    // 0 & 0 & 0 = 0
    // 0 & 0 & 1 = 0
    // 0 & 1 & 0 = 0
    // 0 & 1 & 1 = 0
    // 1 & 0 & 0 = 0
    // 1 & 0 & 1 = 0
    // 1 & 1 & 0 = 0
    // 1 & 1 & 1 = 1

    
