// ------------------------- 
// Exemplo0009 - and (3 PORTAS)
// Nome: Eduardo Manoel de Paula Junior
// Matricula: 427396
// ------------------------- 

// ------------------------- 
// -- buffer 
// ------------------------- 
module and3gate (output s, input p, input q, input r); 
 assign s = (p & q & r) ; 
 //como tratamos da operacao logica AND ela pode ser
 //escrita em qualquer ordem pois ela eh comutativa(ordem nao importa)
endmodule //and3gate
 
// ------------------------- 
// -- test buffer 
// ------------------------- 
module testand3gate; 
// ------------------------- dados locais 
   reg   a, b, c;    // definir registrador 
                   // (variavel independente) 
   wire  s;    // definir conexao (fio) 
                   // (variavel dependente   ) 
// ------------------------- instancia 
   and3gate AND3GATE1 (s, a, b, c); 
// ------------------------- preparacao 
   initial begin:start 
      a=0; b=0; c=0;
    end 
// ------------------------- parte principal 
 initial begin:main 
  $display("Exemplo 0009 - Eduardo Manoel - 427396"); 
  $display("Test and3gate:"); 
  $display("\na AND b AND c = s\n"); 
  $monitor(" %b AND %b AND %b = %b", a, b, c, s);
  #1 c=1;
  #2 b=1; c=0;
  #3 c=1;
  #4 a=1;b=0;c=0;
  #5 c=1;
  #6 b=1; c=0;
  #7 c=1;
 end 
 
endmodule // testand3gate