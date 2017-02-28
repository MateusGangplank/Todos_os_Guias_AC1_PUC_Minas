/*
01.) Realizar a simulação de um operador de meia-soma
     usando apenas portas NAND
     (modelo tradicional AND, OR, NOT, AND, s0 e s1)
     DICA Usar definições de portas da própria linguagem
           para criar novos módulos

           nand NAND01 (s, x, y); */



module HalfAdder (s0,s1,p,q);
	output s0,s1;
	input p,q;
	nand NAND1 (f1,p,p);
	nand NAND2 (f2,p,q);
	nand NAND3 (f3,q,q);
	nand NAND4 (f4,f1,f3);
	nand NAND5 (S0,f2,f2);
	nand NAND6 (f6,F0,F0);
	nand NAND7 (f7,f6,f4);
	nand NAND8 (s1,f7,f7);
endmodule

module Teste;
       reg p,q;
       wire s0,s1;
       
       HalfAdder HA (s0,s1,p,q);
       
       initial begin
              
       $display ("Ex01_Guia04_Rafael Moreira Melo_405834");
       $display ("Teste EX01");
       
       $monitor ("%b + %b = %b %b", p,q,s1,s0);
       
       p=0; q=0;
       
    #1 p=1; q=0;
    #1 p=0; q=1;
    #1 p=1; q=1;

end
endmodule