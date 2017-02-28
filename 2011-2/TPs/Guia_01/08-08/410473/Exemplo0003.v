// -------------------
// Exemplo0003 - AND
// Nome: Pedro Tronbin
// Matricula: 410473
// -------------------

// ------------------- 


// -------------------
// -- and gate
// -------------------
 
module andgate(output s, input p, input q);
 assign s = p & q; // criar vinculo permanente
               // (dependencia)
					
endmodule // andgate


// -------------------
// -- test andgate
// ------------------- 
module testandgate;
// ------------------- dados locais

      reg a, b;  // definir registrador
		           // (variavel independente)
		wire s;    // definir conexao (fio)
		           // (variavel dependente)
// ------------------- instancia
      andgate AND1(s, a, b);
// ------------------- preparacao
      initial begin: start
		
		  a = 0; b = 0;
		
		end
// ------------------- parte principal		
      initial begin:main
		        // execucao unitaria
			$display("Exemplo 0003 - xxx yyy zzz - 999999");
			$display("Test AND gate:");
			$display("\na & b= s\n");
			a = 0; b = 0;
			#1 $display("%b & %b = %b", a, b, s);
			a = 0; b = 1;
			#1 $display("%b & %b = %b", a, b, s);
			a = 1; b = 0;
			#1 $display("%b & %b = %b", a, b, s);
			a = 1; b = 1;
			#1 $display("%b & %b = %b", a, b, s);
			end
			
			endmodule // testandgate     	
			
			// ------------SAIDA
			
			// Exemplo 0003 - xxx yyy zzz - 999999
         // Test AND gate:
    
         //        a & b= s
    
         //        0 & 0= 0
         //        0 & 1= 0
    		//        1 & 0= 0
   		//        1 & 1= 1