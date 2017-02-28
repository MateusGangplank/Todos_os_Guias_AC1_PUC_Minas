// Nome: Henrique Carvalho Parreira
// Matricula: 347133

module meiadiferenca (s0, s1, a, b);


 output s0, s1;
 input  a, b;
 wire q0;
 

xor XOR1 (s0, a, b);
not NOT1 (q0, a);
and AND1 (s1, q0, b);

 
 endmodule 
 


module diferencacompleta(s0, s1, a, b, v);

wire q0,q1,q2;
output s0, s1;
input a, b, v;

meiadiferenca MD1 (q0, q1, a, b);
meiadiferenca MD2 (s0, q2, v, q0);
or OR1 (s1, q1, q2);

endmodule 




module testediferencacompleta;
 reg   a, b, v;             
 wire  s0, s1;

          
 diferencacompleta DIFERENCACOMPLETA1 (s0, s1, a, b, v);


 initial begin:start
      a=0; b=0; v=0;
 end


          
 initial begin:main
      $display("Nome: Henrique Carvalho Parreira - 347133");
      $display("Diferenca completa usando duas Meia Diferencas.");
      $display("\nv a b = s1 s0\n");
      $monitor(" %b %b %b = %b %b", v, a, b, s1, s0);
#1 a=0;b=1;v=0;
#1 a=1;b=0;v=0;
#1 a=1;b=1;v=0;
#1 a=0;b=0;v=1;
#1 a=0;b=1;v=1;
#1 a=1;b=0;v=1;
#1 a=1;b=1;v=1;
  
 end

endmodule 