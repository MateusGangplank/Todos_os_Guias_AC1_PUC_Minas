// ---------------------
// ---------------------
//  GUIA 05-Exercicio 02
//  CELSO R FRANÇA JR 404590 
// ---------------------

// ---------------------
// -- Meia-Diferenca
// ---------------------

module meiaDiferenca (s0, s1, a, b);

 output s0,s1;
 input a, b;
 xor (s0,a,b);
 not (a1,a);
 and (s1,a1,b);

 	
endmodule

// ---------------------
// --Diferenca-Completa
// ---------------------
module difCompleta (s0, s1, a, b, c);

input a, b, c;
output s0, s1;
meiaDiferenca d1 (d,v,a,b);
meiaDiferenca d2 (s0,v2,d,c);
or (s1,v2,v);

endmodule

// ---------------------
// --Diferenca-2bits
// ---------------------
module diferenca (s0, s1, a0, a1, b0, b1);

input a0, a1, b0, b1;
output s0, s1;
meiaDiferenca d1 (s0, c1, a0, b0);
difCompleta d2 (s1, c2, a1, b1, c1);


endmodule



module testediferenca ( );

reg a0, a1, b0, b1;
wire s0, s1;

diferenca d (s0, s1, a0, a1, b0, b1);

  
  initial begin:start
   a0=0; a1=0; b0=0; b1=0; 
  end

  initial begin: main
 
   $display("Exercicio 02");
   $display("Celso R Franca Jr - 404590");
   $display("\n   Difrenca 2bits");
	$display("aa - bb = ss");	
   $display("_________________\n");
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
	
   #1 $display("_________________");
    
  end
endmodule