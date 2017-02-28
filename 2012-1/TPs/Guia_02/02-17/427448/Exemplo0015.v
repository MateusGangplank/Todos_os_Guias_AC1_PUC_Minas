// ------------------------- 
// Exemplo0015 - BASE 
// Nome: Michelle da Costa Silva
// Matricula: 427448
// Versao:0.5
// -------------------------
 
// ------------------------- 
// test number system 
// -------------------------
 
    module test_base_01; 
      
// ------------------------- definir dados 
    reg [2:0] a; 
    reg [3:0] b; 
    reg [4:0] c; 
    reg [4:0] d; 

// ------------------------- parte principal 
    initial begin 
      $display("Exemplo0015 - Michelle da Costa Silva - 427448"); 
      $display("Test number system"); 
       
		  a = 5; 
        b = 10; 
        c = 15; 
        d = 20; 
   
	   $display("\nPositive value"); 
      $display("a = %d = %3b", a, a); 
      $display("b = %d = %4b", a, a); 
      $display("c = %d = %5b", a, a); 
      $display("b = %d = %4b", b, b); 
      $display("c = %d = %5b", c, c); 
      $display("d = %d = %5b", d, d); 
      $display("d = %d = %5o", d, d); 
      $display("d = %d = %5h", d, d);
		
	     a = -5; 
        b = -5; 
        c = -5; 

      $display("\nNegative value"); 
      $display("a = -5 [3] = %d = %3b", a, a); 
      $display("b = -5 [4] = %d = %4b", b, b); 
      $display("c = -5 [5] = %d = %5b", c, c);
		
		  a = ~5+1; 
        b = ~5+1; 
        c = ~5+1; 
     
	   $display("\nNegative mixed expression"); 
      $display("a = %d = %3b", a, a); 
      $display("b = %d = %4b", b, b); 
      $display("c = %d = %5b", c, c); 
		
		  a = 5 + 3; 
        b = 5 + 3; 
        c = 10 - 5 + 25 + 3 + 1; 

      $display("\nOverflow"); 
      $display("a = %d = %3b", a, a); 
      $display("b = %d = %4b", b, b); 
      $display("c = %d = %5b", c, c);  
		
		$display("\nComplements"); 
      $display("0= %d = %3b = %3b", ~1 , (1-1), ~1 ); 
      $display("1= %d = %3b = %3b", ~0 , (2-1), ~0 ); 
      $display("2= %d = %3b = %3b", (1+1), (3-1), ~0+~0);  
    end 
endmodule // test_base 

  /*documentacao complementar 
        
       historico 
	    Versao         Data          Modificacao 
        0.1           11/02/12 
		  0.2           11/02/12 
		  0.3           11/02/12 
		  0.4           11/02/12
		  0.5           11/02/12
		  
		  
		 				 testes 
       Versao         Teste 
        0.1             01. (OK)       identificacao de programa e leitura
		                                 O programa funcionou conforme o previsto
													
													valores previstos: 
                                        a = 5
                                        b = 10 
                                        c = 15 
                                        d = 20 
													
													Positive value
													 a = 5 = 101
													 b = 5 =  101
													 c = 5 =   101
													 b = 10 = 1010
													 c = 15 = 01111
													 d = 20 = 10100
													 d = 20 =    24
													 d = 20 =    14
		  
		  0.2             01. (OK)       identificacao de programa e leitura
		                                 O programa funcionou conforme o previsto
													
													valores previstos: 
												    a = -5
													 b = -5
													 c = -5
													
													Negative value
													 a = -5 [3] = 3 = 011
													 b = -5 [4] = 11 = 1011
													 c = -5 [5] = 27 = 11011
													  													
		  0.3             01. (OK)       identificacao de programa e leitura
		                                 O programa funcionou conforme o previsto
													
													valores previstos: 
													 a = ~5+1
													 b = ~5+1
													 c = ~5+1 
													
													Negative mixed expression
													 a = 3 = 011
													 b = 11 = 1011
													 c = 27 = 11011
		
		  0.4             01. (OK)       identificacao de programa e leitura
		                                 O programa funcionou conforme o previsto
													
													valores previstos:
													 a = 5 + 3
													 b = 5 + 3
													 c = 10 - 5 + 25 + 3 + 1 
													
													Overflow
													 a = 0 = 000
													 b =  8 = 1000
													 c =  2 = 00010
																 
		  0.5             01. (OK)       identificacao de programa e leitura
		                                 O programa funcionou conforme o previsto
													
													Valores previstos:
													 ~1 , (1-1), ~1 
													 ~0 , (2-1), ~0 
													 (1+1), (3-1), ~0+~0 
													
													Complements
													 0= -2 =   0 =  10
													 1= -1 =  01 =   1
													 2=  2 = 010 =  10
*/													
