//Nome: Gabriel Benjamim de Carvalho
//Matrícula: 396690

 module teste4;
 reg   a, b;
 wire  notA, notB, c, s1, s2, s0, s;
 
 nor NOR0 (notA, a, a);
 nor NOR1 (notB, b, b);
 nor COUT (c, notA, notB);
 nor NOR3 (s1, a, notB);
 nor NOR4 (s2, notA, b);
 nor NOR5 (s0, s1,s2);
 nor NOR6 (s, s0, s0);
          
        
 initial begin
 
      $display("Teste 04 - Operador Meia Soma NOR");
      $display("A  +  B  =  C  S");
      
		a=0; b=0;
		
  	#1	 $monitor("%b  +  %b  =  %b  %b", a, b, c, s);
   #1  a=0; b=1;
   #1  a=1; b=0;
   #1  a=1; b=1;

 end

endmodule 

/* TESTE

Teste 04 - Operador Meia Soma NOR
    A  +  B  =  C  S
    0  +  0  =  0  0
    0  +  1  =  0  1
    1  +  0  =  0  1
    1  +  1  =  1  0
*/