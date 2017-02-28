// ---------------------
// Exemplo 05_01 - soma completa de 3 bits
// Nome: Júlio Cézar Taveira Araújo
// Matricula: 380776
// ---------------------

// ---------------------
// -- meia soma
// ---------------------

module meiasoma (s0, s1, a, b);
 output s0, s1;
 input a, b;
 
 
 xor XOR1(s0, a, b);
 and AND1(s1, a, b); 

endmodule // meiasoma


module somacompleta (s0, s1, vaium, a, b);

 output s0, s1;
 input vaium, a, b;
 wire w1, w2, w3; 
 
meiasoma MS1 (w1, w2, a, b);
meiasoma MS2 (s0, w3, w1, vaium);
or (s1, w3, w2);

endmodule // somacompleta

// ---------------------
// -- SOMA 3 bits
// ---------------------

module soma3 (s3, s2, s1, s0, a0, a1, a2, b0, b1, b2);

input a0, a1, a2, b0, b1, b2;
output s3, s2, s1, s0;
                                                                                                          
meiasoma MS1 (s0, c1, a0, b0);
somacompleta SC1 (s1, c2, a1, b1, c1);
somacompleta SC2 (s2, s3, a2, b2, c2);

endmodule //soma
 

// ---------------------
// --  TESTE SOMA 
// ---------------------

module testesoma;

reg a0, a1, a2, b0, b1, b2;
wire s3, s2, s1, s0;

soma3 S1(s3, s2, s1, s0, a0, a1, a2, b0, b1, b2);

  initial begin:start
   a0=0; a1=0; a2=0;
	b0=0; b1=0; b2=0;
  end

  initial begin: main
 
  
	 $display("Exercicio 05-01 - Julio Cezar Taveira Araujo - 380776");
      $display("Test SomaCompleta DE 3 bits");      
      $display("aaa + bbb = ssss\n");
	   $monitor("%b%b%b + %b%b%b = %b%b%b%b", a2, a1, a0, b2, b1, b0, s3, s2, s1, s0);
     
   #1
	a0=0; a1=0; a2=1;
	b0=0; b1=0; b2=1;
   #1
	a0=0; a1=1; a2=1;
	b0=1; b1=0; b2=0;
  #1
  a0=1; a1=0; a2=1;
  b0=0; b1=0; b2=1;	
	
    
  end
endmodule //testsoma