// -------------------------
// Exemplo0007 - XNOR
// Nome: Ederson Cristiano Nunes 
// Matricula: 438964
// Versao: 0.8
// -------------------------
// -------------------------
// -- nor gate
// -------------------------
module xnorgate ( output s,
                        input p, q);
 assign s =( ~(p^q) );
endmodule // xnorgate
// ---------------------
// -- test nor gate
// ---------------------
module testxnorgate;
// ------------------------- dados locais
   reg a, b; // definir registradores
   wire s; // definir conexao (fio)
// ------------------------- instancia
   xnorgate XNOR1 (s, a, b);
// ------------------------- preparacao
   initial begin:start
      a=0; b=0;
   end
// ------------------------- parte principal
   initial begin
     $display("Exemplo0008 - Ederson Cristiano Nunes - 438964");
     $display("Test XNOR gate");
     $display("\n( ~(a^b) ) = s\n");
   #1 a=0; b=0;
   $monitor("%b | %b = %b", a, b, s);
   #1  a=0; b=1;
   $monitor("%b | %b = %b", a, b, s);
   #1  a=1; b=0;
   $monitor("%b | %b = %b", a, b, s);
   #1  a=1; b=1;
   $monitor("%b | %b = %b", a, b, s);
 end
endmodule // testxnorgate

  //Exemplo0007 - Ederson Cristiano Nunes - 438964
    //Test NOR gate
    
    //~(a | b) = s
    
    //0 | 0 = 1
    //0 | 1 = 0
    //1 | 0 = 0
    //1 | 1 = 0

//Exemplo0008 - Ederson Cristiano Nunes - 438964
    //Test XNOR gate
    
    //( ~(a^b) ) = s
    
    //0 | 0 = 1
    //0 | 1 = 0
    //1 | 0 = 0
    //1 | 1 = 1