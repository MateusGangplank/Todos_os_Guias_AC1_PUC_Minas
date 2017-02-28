// ------------------------- 
// Exemplo0010 - OR  
// Nome: Michelle da Costa Silva
// Matricula: 427448 
// ------------------------- 

// ------------------------- 
// -- or gate
// -------------------------
          module orgate (output s, input p, q, r); 
          assign s = ~(~p & ~q & ~r);  
          endmodule // orgate 
			 
// ------------------------- 
// -- test or gate 
// -------------------------
            module testorgate; 
			  
// ------------------------- dados locais 
            reg a, b, c; // definir registrador 
            wire s; // definir conexao (fio) 

// ------------------------- instancia 
            orgate OR1 (s, a, b, c); 
				 
// ------------------------- preparacao 
            initial begin:start 
              a=0; b=0; c=0;
             end 
				  
// ------------------------- parte principal 
      initial begin:main 
              $display("Exemplo 0010 - Michelle da Costa Silva - 427448"); 
              $display("\nTabela-verdade OR gate com 3 entradas"); 
              $display("\na b c s\n");
				  $monitor("%b %b %b %b", a, b, c, s); 
              a=0; b=0; c=0; 
           #1 a=0; b=0; c=1;
           #1 a=0; b=1; c=0;
           #1 a=0; b=1; c=1;
			  #1 a=1; b=0; c=0;
           #1 a=1; b=0; c=1;
           #1 a=1; b=1; c=0;
			  #1 a=1; b=1; c=1;
			     end 
              endmodule // testorgate