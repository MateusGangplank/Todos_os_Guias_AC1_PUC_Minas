// ------------------------- 
// Exemplo0010 - or (3 PORTAS)
// Nome: Eduardo Manoel de Paula Junior
// Matricula: 427396
// ------------------------- 

// ------------------------- 
// -- buffer 
// ------------------------- 
module or3gate (output s, input p, input q, input r); 
 assign s = (p | q | r) ; 
 //como tratamos da operacao logica OR ela pode ser
 //escrita em qualquer ordem pois ela eh comutativa(ordem nao importa)
endmodule //or3gate
 
// ------------------------- 
// -- test buffer 
// ------------------------- 
module testor3gate; 
// ------------------------- dados locais 
   reg   a, b, c;    // definir registrador 
                   // (variavel independente) 
   wire  s;    // definir conexao (fio) 
                   // (variavel dependente   ) 
// ------------------------- instancia 
   or3gate OR3GATE1 (s, a, b, c); 
// ------------------------- preparacao 
   initial begin:start 
      a=0; b=0; c=0;
    end 
// ------------------------- parte principal 
 initial begin:main 
  $display("Exemplo 0010 - Eduardo Manoel - 427396"); 
  $display("Test or3gate:"); 
  $display("\na OR b OR c = s\n"); 
  $monitor(" %b OR %b OR %b = %b", a, b, c, s);
  #1 c=1;
  #2 b=1; c=0;
  #3 c=1;
  #4 a=1;b=0;c=0;
  #5 c=1;
  #6 b=1; c=0;
  #7 c=1;
 end 
 
endmodule // testor3gate