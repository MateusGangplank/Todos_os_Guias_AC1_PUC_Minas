// Guia 07 - Capitulo 3
// Nome:Luciana Cristina Silva
// Matricula: 365575
// 

//-------------------- Meia Soma

 module meiasoma(s0, s1,x, y);    
 output s0, s1;                  
 input x, y;                     

 xor XOR1(s0, x, y);
 and AND1(s1, x, y);
 
 endmodule
 
 //---------------------soma completa
 
 module somacompleta(s0, s1, x, y, v1);
 output s0, s1;
 input x, y, v1;
 wire s4, s5, s2;
 
 meiasoma HA1(s2, s4, x, y);
 meiasoma HA2(s0, s5, s2, v1);
 or OR1(s1,s5,s4);
 
 endmodule

 //----------------somador completo

 module somadorcompleto (s, v, Over, x, y);
 input [3:0]x, y;
 output [3:0]s;
 output v, Over;
 wire a1, a2, a3;

 meiasoma HA3 (s[0], a1, x[0], y[0]);
 somacompleta HA4 (s[1], a2, x[1], y[1], a1);
 somacompleta HA5 (s[2], a3, x[2], y[2], a2);
 somacompleta HA6 (s[3], v, x[3], y[3], a2);
 xor XOR1(Over, v, a2);

 endmodule
 
 //---------------------------comparador logico
 
 module comparadorlogico (s, x, y);
 input [3:0]x,y;
 output s;
 wire a0, a1, a2, a3;

 xnor XNOR1 (a0, x[0], y[0]);
 xnor XNOR1 (a1, x[1], y[1]);
 xnor XNOR1 (a2, x[2], y[2]);
 xnor XNOR1 (a3, x[3], y[3]);
 and (s, a0, a1, a2, a3);

 endmodule 

 //---------------------------ALU

 module alu5bits (s, v, Comp, Over , x, y);
 input [3:0]x,y;
 output [3:0]s;
 output v, Over, Comp;

 somadorcompleto SOCM1 (s, v, Over, x, y);
 comparadorlogico COMLO1 (Comp, x, y);

 endmodule
 
 //-------------------------meia diferenca

 module meiadiferenca(s0, s1, x, y);    
 output s0, s1;                         
  input x, y;                            
 
  xor XOR1(s0, x, y);                   
  and AND1(s1, ~x, y);
   
 endmodule    
 
 // ---------------------------- Decremento

 module decremento1 (s, c, x);
 input [3:0]x;
 output [3:0]s;
 output c;
 wire [2:0]r3;

 meiadiferenca MD1(s[0],r3[0],x[0],1);
 meiadiferenca MD2(s[1],r3[1],x[1],r3[0]);
 meiadiferenca MD3(s[2],r3[2],x[2],r3[1]);
 meiadiferenca MD4(s[3],c , x[3], r3[2]);

 endmodule
 
 
 //--- -------------------Teste

 module testealu;
 reg [3:0] x,y;
 wire [3:0] Soma, decre;
 wire v, Over, Comp, c;


 alu5bits ALU1(Soma, v, Over, Comp, x, y);
 decremento1 DEC1 (decre, c, x);

 
   initial begin
	   $display("Guia 07 - Exercicio 04");
		$display("Luciana Cristina Silva - 365575");
      $display("Teste ALU");
      $display(" x   +   y =   s    /  Cout / Overflow / Complemento / Complemento 1");

		x = 0;
		y = 0;
  		while(x != 15)
		  begin
		    x = (y == 0)? x : x + 1;
			 y = 0;
  #1      $display("%b + %b = %b   / %b   /     %b   /        %b /  %b; ", x, y, Soma, v, Over, Comp, decre);
			 while(y != 15)
			   begin
				 y = y + 1;
  #1      $display("%b + %b = %b   / %b   /     %b   /        %b /  %b; ", x, y, Soma, v, Over, Comp, decre);
		      end
		  end
  end
 endmodule  

