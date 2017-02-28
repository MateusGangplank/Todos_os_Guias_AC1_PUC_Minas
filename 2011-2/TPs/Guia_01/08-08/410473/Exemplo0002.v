// -------------------
// Exemplo0002 - NOT
// Nome: Pedro Tronbin
// Matricula: 410473
// -------------------

// ------------------- 


// -------------------
// -- not gate
// -------------------
 
module notgate(output s, input p);
 assign s = ~p; // criar vinculo permanente
               // (dependencia)
					
endmodule // notgate


// -------------------
// -- test notgate
// ------------------- 
module testnotgate;
// ------------------- dados locais

      reg a;  // definir registrador
		        // (variavel independente)
		wire s; // definir conexao (fio)
		        // (variavel dependente)
// ------------------- instancia
      notgate NOT1(s, a);
// ------------------- preparacao
      initial begin: start
		
		  a = 0;
		
		end
// ------------------- parte principal		
      initial begin:main
		        // execucao unitaria
			$display("Exemplo 0002 - xxx yyy zzz - 999999");
			$display("Test NOT gate:");
			$display("\n~a= s\n");
			a = 0;
			#1 $display("~%b= %b", a, s);
			a = 1;
			#1 $display("~%b= %b", a, s);
			
			end
			
			endmodule // testnotgate     	
			
			// ------------SAIDA
			
			// Exemplo 0002 - xxx yyy zzz - 999999
         // Test NOT gate:
    
         //        ~a= s
    
         //        ~0= 1
         //        ~1= 0
