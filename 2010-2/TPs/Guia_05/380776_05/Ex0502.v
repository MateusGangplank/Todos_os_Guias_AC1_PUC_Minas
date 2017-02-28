// ---------------------
// Exemplo 05_02 - DIFERENCA COMPLETA 2 BITS
// Nome: Júlio Cézar Taveira Araújo
// Matricula: 380776
// ---------------------

// ---------------------
// -- DIFERENCA COMPLETA
// ---------------------

module meiaDiferenca (s0, s1, a, b);

 output s0, s1;
 input a,  b;
 wire w1;
 
 xor (s0, a, b);
 not (w1, a);
 and (s1, w1, b);

 	
endmodule //meiaDiferenca

// ---------------------
// --Diferenca-Completa
// ---------------------

module DiferencaCompleta (s0, s1, a, b, vaium);

input a, b, vaium;
output s0, s1;
wire w0, w1, w2;

meiaDiferenca DC1 (w0, w1, a, b);
meiaDiferenca DC2 (s0, w2, w0, vaium);
or (s1, w2, w1);

endmodule // DiferencaCompleta

// ---------------------
// --Diferenca-2bits
// ---------------------
module diferenca (s0, s1, a0, a1, b0, b1);

input a0, a1, b0, b1;
output s0, s1;
wire w0, w1;

meiaDiferenca DC1 (s0, w0, a0, b0);
DiferencaCompleta DC2 (s1, w1, a1, b1, w0);


endmodule //diferenca



module testediferenca;

reg a0, a1, b0, b1;
wire s0, s1;

diferenca D1 (s0, s1, a0, a1, b0, b1);

  
  initial begin:start
  
   a0=0; a1=0; b0=0; b1=0; 
	
  end

  initial begin: main
 
   
	 $display("Exercicio 05-02 - Julio Cezar Taveira Araujo - 380776");
         $display("Test DifenrecaCompleta 2 bits");
			$display("aa - bb = ss");	   
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
endmodule //testediferenca