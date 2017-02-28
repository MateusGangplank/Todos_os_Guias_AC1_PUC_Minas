// ------------------------- 
// Exemplo0008 - xnor
// Nome: Eduardo Manoel de Paula Junior
// Matricula: 427396
// ------------------------- 

// ------------------------- 
// -- buffer 
// ------------------------- 
module xnorgate (output s, input p, input q); 
 assign s = ~(p^q) ; 
endmodule //xnorgate
 
// ------------------------- 
// -- test buffer 
// ------------------------- 
module xtestnorgate; 
// ------------------------- dados locais 
   reg   a, b;    // definir registrador 
                   // (variavel independente) 
   wire  s;    // definir conexao (fio) 
                   // (variavel dependente   ) 
// ------------------------- instancia 
   xnorgate XNOR1 (s, a, b); 
// ------------------------- preparacao 
   initial begin:start 
      a=0; b=0;
    end 
// ------------------------- parte principal 
 initial begin:main 
  $display("Exemplo 0008 - Eduardo Manoel - 427396"); 
  $display("Test norgate:"); 
  $display("\na XNOR b = s\n"); 
  $monitor(" %b XNOR %b = %b", a, b, s);
  #1 b=1;
  #2 a=1; b=0;
  #3 b=1;
 end 
 
endmodule // testxnorgate