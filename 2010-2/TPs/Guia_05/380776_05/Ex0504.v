// ---------------------
// Exemplo 05_04 - SOMA COMPLETA 2 BITS NAND
// Nome: Júlio Cézar Taveira Araújo
// Matricula: 380776
// ---------------------

// ---------------------
// -- Meia-Soma
// ---------------------

module meiasoma (s0, s1, a, b);

 output s0,s1;
 input a, b;
 wire w1, w2, w3, w4;
 
 nand NAND1 (w1,a,b);
 nand NAND2 (w2,b,w1);
 nand NAND3 (w3,a,w1);
 nand NAND4 (s0,w3,w2);
 nand NAND5 (w4,a,b);
 nand NAND6 (s1,w4,w4);

endmodule//meiasoma

// ---------------------
// -- SOMA COMPLETA
// ---------------------

module somaCompleta (s0, s1, a, b, vaium );

input a, b, vaium;
output s0, s1;
wire w1, w2, w3, w4, w5;

meiasoma MS1 (w1,w2,a,b);
meiasoma MS2 (s0,w3,w1,vaium);
nand NAND1 (w4,w2,w2);
nand NAND2 (w5,w3,w3);
nand NAND3 (s1,w4,w5);

endmodule//somaCompleta

// ---------------------
// -- SOMA
// ---------------------

module soma (s2, s1, s0, a0, a1,b0, b1);

input a0, a1, b0, b1;
output s2, s1, s0;
wire w1;

meiasoma MS1 (s0,w1,a0,b0);
somaCompleta SC1 (s1,s2,a1,b1,w1);


endmodule//soma


// ---------------------
// --  TESTE SOMA 
// ---------------------
module testesoma;

reg a0, a1, b0, b1;
wire s2, s1, s0;

soma SOMA1( s2, s1, s0, a0, a1, b0, b1);

  initial begin:start
  
   a0=0; a1=0; 
	b0=0; b1=0; 
	
  end

  initial begin: main
 
   $display("Exercicio 05-04 - Julio Cezar Taveira Araujo - 380776");
      $display("Test SomaCompleta 2 bits com NANDs");  
      $display("aaa + bbb = ssss\n");
	   $monitor("%b%b + %b%b = %b%b%b", a1, a0, b1, b0, s2, s1, s0);
     
   #1
	a0=0; a1=1; 
	b0=0; b1=1; 
   #1
	a0=0; a1=1; 
	b0=1; b1=0;
  #1
  a0=1; a1=1; 
  b0=1; b1=1;
    
  end
endmodule