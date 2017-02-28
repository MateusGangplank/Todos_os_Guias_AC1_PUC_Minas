// -------------------
// Exemplo0004 - OR
// Nome: Pedro Tronbin
// Matricula: 410473
// -------------------

// ------------------- 


// -------------------
// -- or gate
// -------------------
 
module orgate(output s, input p, input q);
 assign s = p | q; // criar vinculo permanente
               // (dependencia)
					
endmodule // orgate


// -------------------
// -- test orgate
// ------------------- 
module testorgate;
// ------------------- dados locais

      reg a, b;  // definir registrador
		           // (variavel independente)
		wire s;    // definir conexao (fio)
		           // (variavel dependente)
// ------------------- instancia
      orgate OR1(s, a, b);
// ------------------- preparacao
      initial begin: start
		
		  a = 0; b = 0;
		
		end
// ------------------- parte principal		
      initial begin:main
		        // execucao unitaria
			$display("Exemplo 0004 - xxx yyy zzz - 999999");
			$display("Test OR gate:");
			$display("\na | b= s\n");
			a = 0; b = 0;
			#1 $display("%b | %b = %b", a, b, s);
			a = 0; b = 1;
			#1 $display("%b | %b = %b", a, b, s);
			a = 1; b = 0;
			#1 $display("%b | %b = %b", a, b, s);
			a = 1; b = 1;
			#1 $display("%b | %b = %b", a, b, s);
			end
			
			endmodule // testorgate     	
			
			// ------------SAIDA
			
			// Exemplo 0004 - xxx yyy zzz - 999999
         // Test OR gate:
    
         //        a | b= s
    
         //        0 | 0= 0
         //        0 | 1= 1
    		//        1 | 0= 1
   		//        1 | 1= 1