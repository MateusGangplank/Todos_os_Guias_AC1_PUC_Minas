// Guia 08 - Capitulo 3
// Nome: Karen Alves Pereira
// Matricula: 407451
// Data: 07/04/2011
//-------------------------------

 module simpleficacaoQM (s, a, b, c, d, e);
 output s;
 input a,b,c,d,e;
 wire tem1,tem2,tem3,tem4,tem5,tem6,tem7,tem8,tem9,tem10,tem11;

 not NOT1 (tem1,a);
 not NOT2 (tem2,c);
 not NOT3 (tem3,d);
 not NOT4 (tem6,b);
 and AND1 (tem4,tem1,tem2,tem3);
 and AND2 (tem5,a,c,tem3);
 and AND3 (tem7,tem6,e);
 and AND4 (tem8,c,e);
 and AND5 (tem11,a,tem6,tem2,d);
 or OR1 (s,tem4,tem5,tem7,tem8,tem11);


 endmodule

 module testsimplificacaoQM;
 reg a,b,c,d,e;
 wire s;

 simplificacaoQM  SIMQM1 ( s,a,b,c,d,e );

  initial begin
        $display ("Laboratorio 08 - Karen Alves Pereira - 407451");
        $display ("TESTE SIMPLIFICACAO POR Quine-McCluskey");    
		  $display ("\na   b   c   d   e =   s\n");
        $monitor (" %b   %b   %b   %b   %b =   %b ",a,b,c,d,e,s);
            
				    a=0; b=0;    c=0;   d=0;   e=0;      
			 #1   a=0;  b=0;    c=0;   d=0;   e=1;
			 #1   a=0;  b=0;    c=0;   d=1;   e=0;
			 #1   a=0;  b=0;    c=0;   d=1;   e=1;
			 #1   a=0;  b=0;    c=1;   d=0;   e=0;
			 #1   a=0;  b=0;    c=1;   d=0;   e=1;
			 #1   a=0;  b=0;    c=1;   d=1;   e=0;
			 #1   a=0;  b=0;    c=1;   d=1;   e=1;
			 #1   a=0;  b=1;    c=0;   d=0;   e=0;
			 #1   a=0;  b=1;    c=0;   d=0;   e=1;
			 #1   a=0;  b=1;    c=0;   d=1;   e=0;
			 #1   a=0;  b=1;    c=0;   d=1;   e=1;
			 #1   a=0;  b=1;    c=1;   d=0;   e=0;
			 #1   a=0;  b=1;    c=1;   d=0;   e=1;
			 #1   a=0;  b=1;    c=1;   d=1;   e=0;
			 #1   a=0;  b=1;    c=1;   d=1;   e=1;
			 #1   a=1;  b=0;    c=0;   d=0;   e=0;
			 #1   a=1;  b=0;    c=0;   d=0;   e=1;
			 #1   a=1;  b=0;    c=0;   d=1;   e=0;
			 #1   a=1;  b=0;    c=0;   d=1;   e=1;
			 #1   a=1;  b=0;    c=1;   d=0;   e=0;
			 #1   a=1;  b=0;    c=1;   d=0;   e=1;
			 #1   a=1;  b=0;    c=1;   d=1;   e=0;
			 #1   a=1;  b=0;    c=1;   d=1;   e=1;
			 #1   a=1;  b=1;    c=0;   d=0;   e=0;
			 #1   a=1;  b=1;    c=0;   d=0;   e=1;
			 #1   a=1;  b=1;    c=0;   d=1;   e=0;
			 #1   a=1;  b=1;    c=0;   d=1;   e=1;
			 #1   a=1;  b=1;    c=1;   d=0;   e=0;
			 #1   a=1;  b=1;    c=1;   d=0;   e=1;
			 #1   a=1;  b=1;    c=1;   d=1;   e=0;
			 #1   a=1;  b=1;    c=1;   d=1;   e=1;
			  
	end
			  
 endmodule