/*
01.) Realizar a simulação de um operador de meia-soma
     usando apenas portas NOR
     (modelo tradicional AND, OR, NOT, AND, s0 e s1)
     DICA Usar definições de portas da própria linguagem
           para criar novos módulos

           nor NOR01 (s, x, y); */
           
module norGate (s0,a,b);
       output s0;
       input a,b;
       
       assign s0=~(a|b);
       
endmodule

module HalfAdder (s0,s1,p,q);
       output s0,s1;
       input p,q;
       
       norGate NOR1 (s2,p,q);
       norGate NOR2 (s3,p,p);
       norGate NOR3 (s4,q,q);
       norGate NOR4 (s1,s3,s4);
       norGate NOR5 (s0,s2,s1);
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