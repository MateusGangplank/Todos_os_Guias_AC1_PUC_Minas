// ------------------------- 
// Extra02 
// Versao: 1.2
// Nome: Michelle da Costa Silva
// Matricula: 427448
// -------------------------
 
// ------------------------- 
// -- Complemento de 2
// ------------------------- 
 
     module complemento2(output [7:0]s, input [7:0]p);
	     assign s = ~p + 1;
     endmodule //complemento2
 
// ------------------------- 
//  --test Complemento de 2
// ------------------------- 
 
     module testcomplemento2;
	   
// ------------------------- definir dados 
      
		reg [7:0] a; 
		wire [7:0] s;
		
// ------------------------- instancia 
		
		complemento2 C1(s,a); 

// ------------------------- preparacao 
		
 initial begin: start 
		a = 8'b00000000; 
	end

// ------------------------- parte principal 
 
    initial begin 
         $display("Extra02 - Michelle da Costa Silva - 427448"); 
         $display("Complemento de 2"); 
         $monitor("%8b = %8b", a, s);
      #1 a=9'b111111111; 
      #1 a=9'b10101010;
		 
    end 
  endmodule // testcomplemento2
  
  /*documentacao complementar 
        
       historico 
	    Versao         Data          Modificacao 
        0.1           11/02/12 
		  0.2           11/02/12 
		  0.3           11/02/12 
		  0.4           11/02/12
		  0.5           11/02/12
		  0.6           11/02/12
		  0.7           11/02/12
		  0.8           11/02/12
		  0.9           11/02/12
		  1.0           11/02/12
		  1.1           11/02/12
		  1.2           11/02/12
		  
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
													
													Valores previstos:
													  a = 2 + 15; 
                                         b = 3 * 8; 
                                         c = 32 / 3; 
                                         d = 21 - 11; 
                                         e = 2 * 5 + 6 - 1; 
													  
													 Exercicio 01
													 Test number system
													  a = 17 = 010001
                                         b = 24 = 011000
                                         c = 10 = 01010
	                                      d = 10 = 01010
	                                      e = 15 = 01111
													  
         0.7             01. (OK)      identificacao de programa e leitura
		                                 O programa funcionou conforme o previsto
													
													Valores previstos:
													   a = 'b101010 + 'b11010; 
                                          b = 'b11010 + 'o25; 
                                          c = 'o1234 / 'h2B; 
                                          d = 'h1CA - 'b101110001; 
                                          e = (25 * 'o31)+ 'h7A; 
													  
													 Exercicio 02
													 Test number system
													   a =  68 = 01000100 
														b = 47 = 0101111 
														c = 15 = 01111 
														d =  89 = 01011001 
														e = 3 = 011 
														
			 0.8             01. (OK)     identificacao de programa e leitura
		                                 O programa funcionou conforme o previsto
													
													Valores previstos:
									               a = ~'b100111 + 1; 
                                          b = ~'o23 + 1; 
                                          c = ~'d23 + 1; 
                                          d = ~'h2B + 1; 
                                          e = 26 - 36; 
													  
													 Exercicio 03
													 Complemento de 2
                                          a = 25 = 011001
                                          b = 45 = 101101
	                                       c =  9 = 01001
                                         	d = 21 = 010101
	                                       e =  6 = 0110
											
														
			 0.9             01. (OK)     identificacao de programa e leitura
		                                 O programa funcionou conforme o previsto
													
													Valores previstos:
									               a = ~8'b101010 + 1; 
                                          b = ~6'b011011 + 1;
                                          c = ~6'd23 + 1; 
                                          d = ~5'hE + 1; 
                                          e = ~6'o26 + 1; 
													   													  
													 Exercicio 04
                                         Test number system
  													  a = 214 = 11010110
													  b = 37 = 100101
													  c = 41 = 101001
													  d = 18 = 10010
													  e = 234 = 101010
													  													  
	        1.0             01. (OK)    identificacao de programa e leitura
		                                 O programa funcionou conforme o previsto
													
													Valores previstos:
									              a = 8'b101010 + (~8'b1101 + 1); 
                                         b = 8'b11010 + (~8'o15 + 1); 
                                         c = 8'o34 + (~8'hB + 1); 
                                         d = 8'hCA + (~8'b10111001 + 1); 
                                         e = 8'd25 + (~8'h1A + 1); 
													   													  
													 Exercicio 04
                                         Test number system
  													    a =  29 = 000011101
														 b =  13 = 000001101
														 c =  17 = 000010001
														 d =  17 = 000010001
														 e = 255 = 11111111	
														 														
			 1.1             01. (OK)    identificacao de programa e leitura
		                                 O programa funcionou conforme o previsto
													
													Valores previstos:
									               a = 8'b00000000; 
	                                       a = 9'b111111111; 
                                          a = 9'b10101010;
					   													  
													  Extra - complemento de 1
                                             00000000 = 11111111
															11111111 = 00000000
															10101010 = 01010101
			
			  1.2             01. (OK)    identificacao de programa e leitura
		                                 O programa funcionou conforme o previsto
													
													Valores previstos:
									               a = 8'b00000000; 
	                                       a = 9'b111111111; 
                                          a = 9'b10101010;
													   													  
													  Extra - complemento de 2
													   00000000 = 00000000
														11111111 = 00000001
														10101010 = 01010110										
											

  
*/													
