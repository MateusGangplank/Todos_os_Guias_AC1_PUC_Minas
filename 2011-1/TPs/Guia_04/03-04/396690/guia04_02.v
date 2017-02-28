//Nome: Gabriel Benjamim de Carvalho
//Matrícula: 396690



module meiasoma (s0, s1, a, b);

 output s0, s1;
 input  a, b;
 

xor XOR1 (s0, a, b);
and AND1 (s1, a, b);
 
 endmodule 
 


module somacompleta(s0, s1, a, b, v);

wire q0,q1,q2;
output s0, s1;
input a, b, v;


meiasoma MS1 (q0, q1, a, b);
meiasoma MS2 (s0, q2, q0, v);
or OR1 (s1, q1, q2);


endmodule


module testesomacompleta;

 reg   a, b, v;             
 wire  s0, s1;
         
 somacompleta SOMACOMPLETA1 (s0, s1, a, b, v);


 initial begin:start
      a=0; b=0; v=0;

 end

          
 initial begin:main

      $display("Nome: Gabriel Benjamim de Carvalho - 396690");
      $display("Soma Completa usando dois operadores de Meia Soma.");
      $display("\nv a b = s0 s1\n");
      $monitor(" %b %b %b = %b %b", v, a, b, s0, s1);

#1 a=0;b=1;v=0;
#1 a=1;b=0;v=0;
#1 a=1;b=1;v=0;
#1 a=0;b=0;v=1;
#1 a=0;b=1;v=1;
#1 a=1;b=0;v=1;
#1 a=1;b=1;v=1;
  
 end

endmodule 