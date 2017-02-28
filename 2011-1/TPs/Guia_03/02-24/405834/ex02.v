/*02.) Realizar a simulação de um operador de meia-soma
     usando apenas portas NAND
     (modelo tradicional: AND, OR, NOT, AND, s0 e s1)
     DICA: Usar definições de portas da própria linguagem
           para criar novos módulos:

           nand NAND01 (s, x, y);*/

module nandGate (s0,p,q);
       output s0;
       input p,q;
       assign s0= ~(p&q);
endmodule

module notGate (s,p);
       output s;
       input p;
       nandGate nand1 (s,p,p);
endmodule

module orGate (s,p,q);
       output s;
       input p,q;
       notGate not1(s1,p);
       notGate not2(s2,q);
       nandGate nand1(s,s1,s2);
endmodule

module andGate (s,p,q);
       output s;
       input p,q;
       nandGate nand1 (s0,p,q);
       notGate  not1 (s,s0);
endmodule

module HalfAdder (s,c,p,q);
       output s,c;
       input p,q;
       orGate or1 (s0,p,q);
       andGate and1 (c,p,q);
       notGate not1 (s1,c);
       andGate and2 (s,s0,s1);
endmodule

module TesteEx02;

       reg x,y;
       wire S0,C1;

       HalfAdder ha1 (S0,C1,x,y);

       initial begin

       $display ("Ex02_Guia03_Rafael Moreira Melo_405834");
       $display ("Teste EX02");

       $monitor ("%b + %b = %b %b", x,y,C1,S0);

       x=0; y=0;

    #1 x=1; y=0;
    #1 x=0; y=1;
    #1 x=1; y=1;

end
endmodule