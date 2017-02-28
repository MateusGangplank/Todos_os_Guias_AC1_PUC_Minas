
//Nome: Gabriel Benjamim de Carvalho
//Matrícula: 396690

 module teste1;

 reg   a, b;

 wire  co, s, s0, s1, x, y;
 
 not NOT1 (x, a);              // FAZER A DEFINICAO EM OUTRO MODULO
 not NOT2 (y, b);
 and AND1 (s0, x, b);
 and AND2 (s1, a, y);
 or OR1   (s, s0, s1);
 and AND3 (co, a, b);
           
         
 initial begin
 
      $display("Teste 01 - Operar Meia Soma");
      $display("A  +  B  =  C  S");
      
		a=0; b=0;
		
  	#1	 $monitor("%b  +  %b  =  %b  %b", a, b, co, s);
   	#1  a=0; b=1;
   	#1  a=1; b=0;
   	#1  a=1; b=1;
 
 end

endmodule 

/* TESTE

Teste 01 - Operar Meia Soma
    A  +  B  =  C  S
    0  +  0  =  0  0
    0  +  1  =  0  1
    1  +  0  =  0  1
    1  +  1  =  1  0
*/