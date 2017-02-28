// ------------------------- 
// Exemplo0006 - nand 
// Nome: Eduardo Manoel de Paula Junior
// Matricula: 427396
// ------------------------- 

// ------------------------- 
// -- buffer 
// ------------------------- 
module nandgate (output s, input p, input q); 
 assign s = ~(p&q) ; 
endmodule //nandgate
 
// ------------------------- 
// -- test buffer 
// ------------------------- 
module testnandgate; 
// ------------------------- dados locais 
   reg   a, b;    // definir registrador 
                   // (variavel independente) 
   wire  s;    // definir conexao (fio) 
                   // (variavel dependente   ) 
// ------------------------- instancia 
   nandgate NAND1 (s, a, b); 
// ------------------------- preparacao 
   initial begin:start 
      a=0; b=0;
    end 
// ------------------------- parte principal 
 initial begin:main 
  $display("Exemplo 0006 - Eduardo Manoel - 427396"); 
  $display("Test nandgate:"); 
  $display("\na NAND b = s\n"); 
  
  #1 $display("%b NAND %b = %b", a, b, s);
     b=1;
  #2 $display("%b NAND %b = %b", a, b, s);
     a=1; b=0;
  #3 $display("%b NAND %b = %b", a, b, s);
     b=1;
  #4 $display("%b NAND %b = %b", a, b, s);
 end 
 
endmodule // testnandgate