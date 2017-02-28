// ------------------------- 
// Exemplo0014 - BASE 
// Versao: 0.4
// Nome: Michelle da Costa Silva
// Matricula: 427448
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
       $display("Exemplo0014 - Michelle da Costa Silva - 427448"); 
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
		 
       end 
     endmodule // test_base 
	  
	  /*documentacao complementar 
        
       historico 
	    Versao         Data          Modificacao 
        0.1           11/08/11 
		  0.2           11/08/11 
		  0.3           11/08/11 
		  0.4           11/08/11
		  		  
		  
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
																 
								 																														
		*/  