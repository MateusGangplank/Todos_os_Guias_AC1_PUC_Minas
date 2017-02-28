/*03.) Realizar a simulação de um operador de meia-diferença
     usando apenas portas NAND
     (modelo compacto: AND, XOR, NOT, s0 e s1)
     DICA: Usar a definição de porta da própria linguagem
           para criar novos módulos:

           nor  NOR01 (s, x, y);*/

module nandGate (s,p,q);
       input p,q;
       output s;
       assign s= ~(p&q);
endmodule

module notGate (s,p);
       output s;
       input p;
       nandGate nand1 (s,p,p);
endmodule

module andGate (s,p,q);
       output s;
       input p,q;
       nandGate nand1 (s0,p,q);
       notGate  not1 (s,s0);
endmodule

module xorGate (s,p,q);
       output s;
       input p,q;
       nandGate nand1 (s0,p,p);
       nandGate nand2 (s1,q,q);
       nandGate nand3 (s2,q,s0);
       nandGate nand4 (s3,s1,p);
       nandGate nand5 (s,s3,s2);
endmodule

module HalfSubtrator (s0,s1,p,q);
       output s0,s1;
       input p,q;
       xorGate xor1 (s0,p,q);
       notGate not1 (s2,p);
       andGate and1 (s1,s2,q);
endmodule

module TesteEx03;

       reg x,y;
       wire S0,S1;

       HalfSubtrator HS (S0,S1,x,y);

       initial begin

       $display ("Ex03_Guia03_Rafael Moreira Melo_405834");
       $display ("Teste EX03");

       $monitor ("%b - %b = %b %b", x,y,S1,S0);

       x=0; y=0;

    #1 x=1; y=0;
    #1 x=0; y=1;
    #1 x=1; y=1;

end
endmodule