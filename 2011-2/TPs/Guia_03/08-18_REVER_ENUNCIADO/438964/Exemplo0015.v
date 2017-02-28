  // ------------------------- 
// Exemplo0015 - BASE 
// Nome: Ederson Cristiano Nunes 
// Matricula: 438964
// Versao: 0.5
// ------------------------- 
 
// ------------------------- 
//  test number system 
// ------------------------- 
 
module test_base_01; 
// ------------------------- definir dados 
      reg [2:0] a; 
      reg [3:0] b; 
      reg [4:0] c; 
      reg [4:0] d; 
 
// ------------------------- parte principal 
 initial begin 
      $display("Exemplo0015 - Ederson Cristiano Nunes - 438964"); 
      $display("Test number system"); 
		
      a =   5; 
      b =  10; 
      c =  15; 
      d =  20; 
       
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
      $display("0= %d = %3b = %3b",   ~1   , (1-1),   ~1    ); 
      $display("1= %d = %3b = %3b",   ~0   , (2-1),   ~0    ); 
      $display("2= %d = %3b = %3b", (1+1), (3-1), ~0+~0);	
		end 
 
endmodule // test_base 
 
//----------------------------------------------------------
//Exemplo0011 - Ederson Cristiano Nunes - 438964
    //Test number system
    
    //Positive value
    //a = 5 = 101
    //b = 5 =  101
    //c = 5 =   101
    //b = 10 = 1010
    //c = 15 = 01111
    //d = 20 = 10100
    //d = 20 =    24
    //d = 20 =    14
//------------------------------------------------------------

// inclusao de parte principal
// mudanca de versao 0.2

 //Exemplo0012 - Ederson Cristiano Nunes - 438964
    //Test number system
    
    //Positive value
    //a = 5 = 101
    //b = 5 =  101
    //c = 5 =   101
    //b = 10 = 1010
    //c = 15 = 01111
    //d = 20 = 10100
    //d = 20 =    24
    //d = 20 =    14
    
    //Negative value
    //a = -5 [3] = 3 = 011
    //b = -5 [4] = 11 = 1011
    //c = -5 [5] = 27 = 11011
//-------------------------------------------------------------

// inclusao de trecho final: 
// Negative mixed expression
// mudanca de versao 0.3

//Exemplo0013 - Ederson Cristiano Nunes - 438964
    //Test number system
    
    //Positive value
    //a = 5  =   101
    //b = 5  =   101
    //c = 5  =   101
    //b = 10 =  1010
    //c = 15 = 01111
    //d = 20 = 10100
    //d = 20 =    24
    //d = 20 =    14
    
    //Negative mixed expression
    //a = 3  =   011
    //b = 11 =  1011
    //c = 27 = 11011
 //-----------------------------------------------------------
 
// mudanca de versao 0.4
// inclusao de teste de transbordamento

 //Exemplo0014 - Ederson Cristiano Nunes - 438964
    //Test number system
    //Positive value
    //a = 5  =   101
    //b = 5  =   101
    //c = 5  =   101
    //b = 10 =  1010
    //c = 15 = 01111
    //d = 20 = 10100
    //d = 20 =    24
    //d = 20 =    14
    
    //Overflow
    //a = 0  =   000
    //b =  8 =  1000
    //c =  2 = 00010
//-----------------------------------------------------------
// mudanca de versao para 0.5
// inclusao de teste de complemento
// Complements
    //0= -2 =   0 =  10
    //1= -1 =  01 =   1
    //2=  2 = 010 =  10
    

