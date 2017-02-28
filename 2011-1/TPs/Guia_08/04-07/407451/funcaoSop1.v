// Guia 08 - Capitulo 3
// Nome: Karen Alves Pereira
// Matricula: 407451
// Data: 07/04/2011
//-------------------------------

 module funcaoSop1(s, a, b, c, d);
 output s;
 input a, b, c, d;
 wire tem1, tem2, tem3, tem4, tem5, tem6;

 not NOT1 (tem1, a);
 not NOT2 (tem2, c);
 and AND1 (tem3, a , tem2, d);
 and AND2 (tem4, tem1, c);
 and AND3 (tem5, b, d);
 and AND4 (tem6, b, c);
 or OR1(s, tem3, tem4, tem5, tem6);
 
 endmodule
 
 module testefuncaoSop1;
 reg a, b, c, d;
 wire s;
 
  funcaoSop1 FUN1 (s, a, b, c, d);
 
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
 
 