/* 03.) Realizar a simulação de um operador de diferença-completa
     usando pelo menos dois subcircuitos de meia-diferença
     (modelo compacto AND, XOR, NOT, s0, s1 e s2).
     DICA Usar subcircuitos no Logisim. 
     */
     
module SubtratorMeio (s0,s1,e1,e2);
       input e1,e2;
       output s0,s1;
       
       xor XOR1 (s0,e1,e2);
       and AND1 (s1,~e1,e2);
endmodule

module SubtratorCompleto (s0,s1,e1,e2,e3);
       input e1,e2,e3;
       output s0,s1:
       
       SubtratorMeio HS1 (f1,f2,e1,e2);
       SubtratorMeio HS2 (s0,f3,f1,e3);
       or OR1 (s1,f3,f2);
endmodule

module Teste;
       reg e1,e2,e3;
       wire s0,s1;
       
       SubtratorCompleto (s0,s1,e1,e2,e3);
       
       initial begin
       
       $display ("Ex03_Guia04_Rafael Moreira Melo_405834");
       $display ("Teste EX03");

       $monitor ("%b %b %b = %b %b", e1,e2,e3,s1,s0);
       

       #1 e1=0; e2=0; e3=1;
       #1 e1=0; e2=1; e3=0;
       #1 e1=0; e2=1; e3=1;
       #1 e1=1; e2=0; e3=0;
       #1 e1=1; e2=0; e3=1;
       #1 e1=1; e2=1; e3=0;
       #1 e2=1; e2=1; e3=1;
       
       end
endmodule
