// Guia 06 - Capitulo 3
// Nome: Karen Alves Pereira
// Matricula: 407451
// Data: 24/03/2011

 //--meia diferenca

 module meiadiferenca(s0, s1, x, y);    
 output s0, s1;                         
  input x, y;                            
 
  xor XOR1(s0, x, y);                   
  and AND1(s1, ~x, y);
   
 endmodule    
 
 //--diferenca completa
 
 module diferencacompleta(s0, s1, x, y, e1);   
 output s0, s1;                                
 input x, y, e1;                                
 
 meiadiferenca FU1(s2, s3, x, y);        
 meiadiferenca FU2(s0, s4, s2, e1);      
 or OR1(s1, s3,s4);                     
 
 endmodule
 
 //--subtrator completa

 module subtrator (s, v, Over, x, y);
 input [3:0] x,y;
 output [3:0]s;
 output v, Over;
 wire a0, a1;

 meiadiferenca DIF1(s[0],    a0, x[0], y[0]);
 diferencacompleta FU3(s[1], a1, x[1], y[1], a0);
 diferencacompleta FU4(s[2], a2, x[2], y[2], a1);
 diferencacompleta FU5(s[3], v,  x[3], y[3], a2);
 xor XOR1(Over, v, a2);

 endmodule 
 
 //--comparador logico
 
 module comparadorlogico (s, x, y);
 input [4:0]x,y; 
 output s;
 wire a0, a1, a2, a3,a4;

 xnor XNOR1 (a0, x[0], y[0]);
 xnor XNOR2 (a1, x[1], y[1]);
 xnor XNOR3 (a2, x[2], y[2]);
 xnor XNOR4 (a3, x[3], y[3]);
 xnor XNOR5 (a4, x[4], y[4]);
 and (s, a0, a1, a2, a3,a4); 

 endmodule 
 
 //--comparador Aritmetico 

 module compradorAri (iG, AM, s[3], x, y);
 input [3:0]x,y;
 output [3:0]s; 
 output iG, AM;

 comparadorlogico COML1(iG, x, y);
 subtrator SUB1(s, v, Over, x, y);
 nor NOR1(AM, iG, s[3]);

 endmodule
 
 //-- ALU2

 module alu2 (s, v, Over, iG, AM, s[3], x, y);
 input [3:0] x,y;
 output [3:0]s;
 output v, Over, iG, AM;

 subtrator DIF1 (s, v, Over, x, y);
 compradorAri COMP1 (iG, AM, s[3], x, y);

 endmodule 
  
 //-- Teste 

 module teste;
 reg [3:0] x , y;
 wire [3:0] dif;
 wire v2,Over2, Comp, iG, AM;


 alu2 AL2(dif, v2, Over2, iG, AM, dif[3], x, y);

 
   initial begin
	   $display("Guia 06 - Exercicio 02");
		$display("Karen Alves Pereira - 407451");
      $display("Teste ALU");
      $display(" x - y =        s /  Cout / Overflow / Iguais / x > y / x < y  ");

		x = 0;
		y = 0;
  	
		while(x != 15)
		  begin
		    x = (y == 0)? x : x + 1;
			 y = 0;
  #1  $display("%b - %b = %b /   %b  /      %b /   %b  /    %b /     %b ",x, y, dif, v2, Over2, iG, AM, dif[3]);
			 while(y != 15)
			   begin
				  y = y + 1;
  #1  $display("%b - %b = %b /   %b /      %b /    %b /     %b /     %b ",x, y, dif, v2, Over2, iG, AM, dif[3]);
		      end
		  end
  end
endmodule