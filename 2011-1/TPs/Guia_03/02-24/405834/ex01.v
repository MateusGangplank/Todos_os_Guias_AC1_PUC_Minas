/*01.) Realizar a simulação de um operador de meia-soma
     (modelo tradicional: AND, OR, NOT, AND, s0 e s1)
     DICA: Usar as primitivas de portas da própria linguagem:

           and AND1 ( x, a, b );*/
           
module HalfAdder (s0,s1,a,b);
       output s0,s1;
       input a,b;
       or OR1 (f1,a,b);
       and AND1 (s1,a,b);
       and AND2 (s0,f1,~s1);
endmodule

module TesteEx01;

       reg x,y;
       wire S0,C1;

       HalfAdder ha1 (S0,C1,x,y);

       initial begin

       $display ("Ex01_Guia03_Rafael Moreira Melo_405834");
       $display ("Teste EX02");

       $monitor ("%b + %b = %b %b", x,y,C1,S0);

       x=0; y=0;

    #1 x=1; y=0;
    #1 x=0; y=1;
    #1 x=1; y=1;

end
endmodule