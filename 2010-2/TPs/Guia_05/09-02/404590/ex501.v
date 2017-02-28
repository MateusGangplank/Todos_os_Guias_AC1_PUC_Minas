// ---------------------
// ---------------------
//  GUIA 05-Exercicio 01
//  CELSO R FRAN�A JR 404590 
// ---------------------

// ---------------------
// -- Meia-Soma
// ---------------------

module meiasoma (s0, s1, a, b);

 output s0,s1;
 input a, b;
 xor (s0,a,b);
 and (s1,a,b);
 
endmodule

// ---------------------
// -- SOMA COMPLETA
// ---------------------
module somaCompleta (s0, s1, a, b, c );

input a, b, c;
output s0, s1;

meiasoma HA1 (r,c1,a,b);
meiasoma HA2 (s0,c2,r,c);
or (s1,c2,c1);

endmodule

// ---------------------
// -- SOMA 3 bits
// ---------------------
module soma (s3, s2, s1, s0, a0, a1, a2, b0, b1, b2);

input a0, a1, a2, b0, b1, b2;
output s3, s2, s1, s0;
                                                                                                          
meiasoma HA1 (s0,c1,a0,b0);
somaCompleta FA1 (s1,c2,a1,b1,c1);
somaCompleta FA2 (s2,s3,a2,b2,c2);

endmodule


// ---------------------
// --  TESTE SOMA 
// ---------------------
module testesoma( );

reg a0, a1, a2, b0, b1, b2;
wire s3, s2, s1, s0;

soma SOMA1(s3, s2, s1, s0, a0, a1, a2, b0, b1, b2);

  initial begin:start
   a0=0; a1=0; a2=0;
	b0=0; b1=0; b2=0;
  end

  initial begin: main
 
   $display("Exercicio 01");
   $display("Celso R Franca Jr - 404590");
   $display("\n     SOMA 3bits\n");
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
	
	
    #1 $display("_____________");
  end
endmodule

