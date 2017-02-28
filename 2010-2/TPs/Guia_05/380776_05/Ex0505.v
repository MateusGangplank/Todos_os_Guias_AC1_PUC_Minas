// ---------------------
// Exemplo 05_05 - DIFERENCA COMPLETA 2 BITS com NOR
// Nome: Júlio Cézar Taveira Araújo
// Matricula: 380776
// ---------------------

// ---------------------
// -- DIFERENCA COMPLETA
// ---------------------

module meiaDiferenca (s0, s1, a, b);

 output s0,s1;
 input a, b;
 wire w1, w2, w3, w4, w5;
 
nor NAND1 (s0,w1,w1);
nor NAND2 (w1,w2,w3);
nor NAND3 (w2,a,w4);
nor NAND4 (w3,b,w4);
nor NAND5 (w4,a,b);
nor NAND6 (s1,a,w5);
nor NAND7 (w5,b,b);

 	
endmodule//meiaDiferenca

// ---------------------
// --Diferenca-Completa
// ---------------------

module diferencaCompleta (s0, s1, a, b, vemum);

input a, b, vemum;
output s0, s1;
wire w1, w2, w3, w4; 

meiaDiferenca DC1 (w1,w2,a,b);
meiaDiferenca DC2 (s0,w3,w1,vemum);
nor NOR1 (w4,w3,w2);
nor NOR2 (s1,w4,w4);
//or (s1,v2,v);

endmodule//difrencaCompleta

// ---------------------
// --Diferenca-2bits
// ---------------------

module diferenca (s0, s1, a0, a1, b0, b1);

input a0, a1, b0, b1;
output s0, s1;
wire w1, w2;

meiaDiferenca d1 (s0, w1, a0, b0);
diferencaCompleta d2 (s1, w2, a1, b1, w1);


endmodule//diferenca



module testediferenca;

reg a0, a1, b0, b1;
wire s0, s1;

diferenca D1 (s0, s1, a0, a1, b0, b1);

  
  initial begin:start
   a0=0; a1=0; b0=0; b1=0; 
  end

  initial begin: main
 
    $display("Exercicio 05-05 - Julio Cezar Taveira Araujo - 380776");
         $display("Test DifenrecaCompleta 2 bits com nors");  
      	$display("aa - bb = s0s1");   
	      $monitor("%b%b - %b%b = %b%b",a1, a0, b1, b0, s1, s0);
   
	 
   #1 a0=0; a1=0; b0=0; b1=0; 
	#1 a0=0; a1=0; b0=0; b1=1;
	#1 a0=0; a1=0; b0=1; b1=0;
	#1 a0=0; a1=0; b0=1; b1=1;
   #1 a0=0; a1=1; b0=0; b1=0;
	#1 a0=0; a1=1; b0=0; b1=1;
   #1 a0=0; a1=1; b0=1; b1=0; 
	#1 a0=0; a1=1; b0=1; b1=1;
   #1 a0=1; a1=0; b0=0; b1=0;
	#1 a0=1; a1=0; b0=0; b1=1;
   #1 a0=1; a1=0; b0=1; b1=0;
   #1 a0=1; a1=0; b0=1; b1=1;
	#1 a0=1; a1=1; b0=0; b1=0;
	#1 a0=1; a1=1; b0=0; b1=1;
	#1 a0=1; a1=1; b0=1; b1=0;
	#1 a0=1; a1=1; b0=1; b1=1;
	
  
    
  end
endmodule