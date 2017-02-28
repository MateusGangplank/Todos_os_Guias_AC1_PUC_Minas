 /* 02.) Realizar a simulação de um operador de soma-completa
     usando pelo menos dois subcircuitos de meia-soma
     (modelo compacto AND, XOR, s0, s1 e s2).
     DICA Para abrir um subcircuito no Logisim, 
           clicar o botão direito sobre o nome do circuito
           e escolher o nome (evitar espaços em branco).
           Observar a seleção do circuitosubcircuito
           de trabalho (lupa).     */

module AndGate (s0,e1,e2);
       input e1,e2;
       output s0;

       assign s0= e1 & e2;
//       and AND1 (s0, e1,e2);
endmodule

module XorGate (s0,e1,e2);
       input e1,e2;
       output s0;

       assign s0 = (~e1 & e2) | (e1 & ~e2);
//       xor XOR1 (s0, e1,e2);
endmodule

module OrGate (s0,e1,e2);
       input e1,e2;
       output s0;

       assign s0 = e1 | e2;
//       or OR1 ( s0, e1, e2);
endmodule

module HalfAdder (s0,s1,e1,e2);
       input e1,e2;
       output s0,s1;

       AndGate AND1 (s1,e1,e2);
       XorGate XOR1 (s0,e1,e2);
endmodule

module SomaCompleta (s0,s1,e1,e2,e3);
       input e1,e2,e3;
       output s0,s1;
       wire   b,d,c;

       HalfAdder HA1 (b,d,e2,e3);
       HalfAdder HA2 (s0,c,e1,b);

       OrGate OR1 (s1,c,d);
endmodule

module Teste;
       reg e1,e2,e3;
       wire s0,s1,s2;

       SomaCompleta SC (s0,s1,e1,e2,e3);

       initial begin
       e1=0; e2=0; e3=0;

       $display ("Ex02_Guia04_Rafael Moreira Melo_405834");
       $display ("Teste EX02");

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

// OBS.: DAR PREFERENCIAS 'AS PORTAS AO INVES DAS EXPRESSOES.