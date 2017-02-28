// Guia 08 - Capitulo 3
// Nome: Karen Alves Pereira
// Matricula: 407451
// Data: 07/04/2011
//-------------------------------

 module funcaoSop2 (s, a, b, c, d);
 output s;
 input a, b, c, d;
 wire tem1, tem2, tem3, tem4, tem5, tem6, tem7;
 
 not NOT1 (tem1,a);
 not NOT2 (tem2,b);
 not NOT3 (tem3,c);
 not NOT4 (tem4,d);
 and AND1 (tem5, a, tem2, tem3);
 and AND2 (tem6, tem1, tem4);
 and AND3 (tem7, a, d);
 or OR1 (s, tem5, tem6, tem7);
 
 endmodule
 
 module testefuncaoSop2;
 reg a, b, c, d;
 wire s;
 
 funcaoSop2 FUN2 (s, a, b, c, d);
 
  initial begin
      $display("Laboratorio 08 - Karen Alves Pereira - 407451");
      $display("TESTE FUNCAO");
      $display("\na    b    c    d    s\n");
      $monitor("%b   %b   %b    %b    %b", a, b, c, d, s);
		
		  a=0; b=0; c=0; d=0;
    #1  a=0; b=0; c=0; d=1;
    #1  a=0; b=0; c=1; d=0;
    #1  a=0; b=0; c=1; d=1;
	 #1  a=0; b=1; c=0; d=0;
    #1  a=0; b=1; c=0; d=1;
    #1  a=0; b=1; c=1; d=0;
    #1  a=0; b=1; c=1; d=1;
    #1  a=1; b=0; c=0; d=0;
    #1  a=1; b=0; c=0; d=1;
    #1  a=1; b=0; c=1; d=0;
	 #1  a=1; b=0; c=1; d=1;
    #1  a=1; b=1; c=0; d=0;
    #1  a=1; b=1; c=0; d=1;
    #1  a=1; b=1; c=1; d=0;
    #1  a=1; b=1; c=1; d=1;  
	    		  
    end
 
 endmodule 
 