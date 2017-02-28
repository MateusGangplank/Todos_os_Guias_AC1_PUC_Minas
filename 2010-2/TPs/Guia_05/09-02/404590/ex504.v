// ---------------------
// ---------------------
//  GUIA 05-Exercicio 04
//  CELSO R FRANÇA JR 404590 
// ---------------------

// ---------------------
// -- Meia-Soma
// ---------------------

module meiasoma (s0, s1, a, b);

 output s0,s1;
 input a, b;
 
 nand NAND1 (s4,a,b);
 nand NAND2 (s3,b,s4);
 nand NAND3 (s2,a,s4);
 nand NAND4 (s0,s2,s3);
 nand NAND5 (s5,a,b);
 nand NAND6 (s1,s5,s5);

endmodule

// ---------------------
// -- SOMA COMPLETA
// ---------------------
module somaCompleta (s0, s1, a, b, c );

input a, b, c;
output s0, s1;

meiasoma HA1 (r,c1,a,b);
meiasoma HA2 (s0,c2,r,c);
nand NAND1 (t1,c1,c1);
nand NAND2 (t2,c2,c2);
nand NAND3 (s1, t1,t2);

endmodule

// ---------------------
// -- SOMA
// ---------------------
module soma (s2, s1, s0, a0, a1,b0, b1);

input a0, a1, b0, b1;
output s2, s1, s0;

meiasoma HA1 (s0,c1,a0,b0);
somaCompleta FA1 (s1,s2,a1,b1,c1);


endmodule


// ---------------------
// --  TESTE SOMA 
// ---------------------
module testesoma( );

reg a0, a1, b0, b1;
wire s2, s1, s0;

soma SOMA1( s2, s1, s0, a0, a1, b0, b1);

  initial begin:start
   a0=0; a1=0; 
	b0=0; b1=0; 
  end

  initial begin: main
 
   $display("Exercicio 04");
   $display("Celso R Franca Jr - 404590");
   $display("\n     SOMA 2bits ( nand gates )\n");
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
	
	
    #1 $display("_____________");
  end
endmodule
