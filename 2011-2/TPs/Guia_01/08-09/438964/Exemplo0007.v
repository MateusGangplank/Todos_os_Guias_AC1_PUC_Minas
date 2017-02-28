// -------------------------
// Exemplo0007 - NOR
// Nome: Ederson Cristiano Nunes 
// Matricula: 438964
// Versao: 0.7
// -------------------------
// -------------------------
// -- nor gate
// -------------------------
module norgate ( output s,
                        input p, q);
 assign s =(~( p | q));
endmodule // norgate
// ---------------------
// -- test nor gate
// ---------------------
module testnorgate;
// ------------------------- dados locais
   reg a, b; // definir registradores
   wire s; // definir conexao (fio)
// ------------------------- instancia
   norgate NOR1 (s, a, b);
// ------------------------- preparacao
   initial begin:start
      a=0; b=0;
   end
// ------------------------- parte principal
   initial begin
     $display("Exemplo0007 - Ederson Cristiano Nunes - 438964");
     $display("Test NOR gate");
     $display("\n~(a | b) = s\n");
   #1 a=0; b=0;
   $monitor("%b | %b = %b", a, b, s);
   #1  a=0; b=1;
   $monitor("%b | %b = %b", a, b, s);
   #1  a=1; b=0;
   $monitor("%b | %b = %b", a, b, s);
   #1  a=1; b=1;
   $monitor("%b | %b = %b", a, b, s);
 end
endmodule // testnorgate

  //Exemplo0007 - Ederson Cristiano Nunes - 438964
    //Test NOR gate
    
    //~(a | b) = s
    
    //0 | 0 = 1
    //0 | 1 = 0
    //1 | 0 = 0
    //1 | 1 = 0
