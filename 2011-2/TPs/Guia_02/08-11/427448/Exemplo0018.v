// ------------------------- 
// Exemplo0018 - BASE 
// versao: 0.8
// Nome: Michelle da Costa Silva
// Matricula: 427448
// -------------------------
 
// ------------------------- 
// test number system 
// -------------------------
        module test_base_01; 
		 
// ------------------------- definir dados 
        reg [5:0] a; 
        reg [5:0] b; 
        reg [3:0] c; 
        reg [7:0] d;
		  reg [3:0] e;
		   
// ------------------------- parte principal 
   initial begin 
       $display("Exemplo0018 - Michelle da Costa Silva - 427448"); 
       $display("Test number system"); 
		 
       a = -'b100111; 
       b = -'o54; 
       c = -'d13; 
       d = -'h1B; 
       e = 25 - 36; 
			 	  
       $display("\nExercicio 3"); 
       $display("a = %d = %6b", a, a);
		 $display("b = %d = %6b", b, b); 
       $display("c = %d = %4b", c, c); 
       $display("d = %d = %8b", d, d); 
       $display("e = %d = %4b", e, e); 
       
       end 
     endmodule // test_base 
	  
	  /*documentacao complementar 
        
       historico 
	    Versao         Data          Modificacao 
        0.1           11/08/11 
		  0.2           11/08/11 
		  0.3           11/08/11 
		  0.4           11/08/11
		  0.5           11/08/11
		  0.6           11/08/11
		  0.7           11/08/11
		  0.8           11/08/11
		
		 		  		  
		  
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
													
	 	  0.6             01. (OK)       identificacao de programa e leitura
		                                 O programa funcionou conforme o previsto
													valores previstos: 
													a.) 2 + 14
													b.) 3 * 7
													c.) 34 / 3
													d.) 19 - 11
													e.) 2 * 4 + 6 - 1
													Exercicio 1
													a = 2 + 14 = 16 = 10000
													b = 3 * 7 = 21 = 10101
													c = 34 / 3 = 11 = 1011
													d = 19 - 11 =  8 = 1000
													e = 2 * 4 + 6 - 1 = 13 = 1101
 
		
		  0.7             01. (OK)       identificacao de programa e leitura
		                                 O programa funcionou conforme o previsto
													valores previstos: 
                                        a.) 100010(2) + 11010(2) 
													 b.) 11010(2) + 23(8)
													 c.) 1234(8) / 2D(16)
													 d.) 1A9(16) - 101101001(2)
													 e.) 25 * 41(8) + 6B(16) 
                                       Exercicio 02
													 a =  60 = 0111100
													 b = 13 = 1101
													 c = 14 = 1110
													 d =  64 = 1000000
													 e = 4 = 100 													
	    
		  0.8             01. (OK)       identificacao de programa e leitura
		                                 O programa funcionou conforme o previsto
													valores previstos:
													a.) 100111(2)
													b.) 54(8)
													c.) 13(10)
													d.) 1B(16)
													e.) 25 - 36 
												  Exercicio 3
												  a = 25 = 011001
												  b = 20 = 010100
												  c =  3 = 0011
												  d = 229 = 11100101
												  e =  5 = 0101
		 
												  													
		  0.9             01. (OK)       identificacao de programa e leitura
		                                 O programa funcionou conforme o previsto
													valores previstos: 
													a.) 100111(2)
													b.) 54(8)
													c.) 13(10)
													d.) 1B(16)
                                      Extra - complemento de 1
												   a = 216 = 11011000
													b = 211 = 11010011
													c = 242 = 11110010
													d = 228 = 11100100
		 											
		  1.0             01. (OK)       identificacao de programa e leitura
		                                 O programa funcionou conforme o previsto
													valores previstos: 
													a.) 100111(2)
													b.) 54(8)
													c.) 13(10)
													d.) 1B(16)
												  Extra - complemento de 2
												   a = 217 = 11011001
													b = 212 = 11010100
													c = 243 = 11110011
													d = 229 = 11100101

													
		 											
								 																														
		*/    