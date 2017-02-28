// ---------------------
// ---------------------
//  GUIA 05-Exercicio 03
//  CELSO R FRANÇA JR 404590 
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
// --Produto
// ---------------------
module produto (s0, cout, e0, e1, e2, e3, cin);

input e0, e1, e2, e3, cin;
output s0, cout;
and AND1 (p1,e0, e1);
and AND2 (p2,e2,e3);
somaCompleta soma (s0,cout,p1,p2,cin);

endmodule

// ---------------------
// --Produto Completo 2bits
// ---------------------
module produtoCompleto (s3, s2, s1, s0, a0, a1, b0, b1);

input a0, a1, b0, b1;
output s3, s2, s1, s0;
reg  p = 0;
produto P1 (s0,cout1,p,p,a0,b0,p);
produto P2 (s1,cout2,a0,b1,a1,b0,cout1);
produto P3 (s2,s3,a1,b1,p,p,cout2 );

endmodule



module testeProduto ( );

reg a0, a1, b0, b1;
wire s3, s2, s1, s0;

produtoCompleto Pt (s3, s2, s1, s0, a0, a1, b0, b1);

  
  initial begin:start
   a0=0; a1=0; b0=0; b1=0; 
  end

  initial begin: main
 
   $display("Exercicio 02");
   $display("Celso R Franca Jr - 404590");
   $display("\n  Produto");
	$display("aa - bb = ss");	
   $display("_________________\n");
	$monitor("%b%b - %b%b = %b%b%b%b",a1, a0, b1, b0, s3, s2, s1, s0 );
   
	 
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