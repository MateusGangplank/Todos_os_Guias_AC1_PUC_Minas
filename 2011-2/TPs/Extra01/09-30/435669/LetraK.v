/*
-------------------------------------
PUC-Minas - Ciência da Computação 
ARQ1 – Extra01
Entrega: 30/09/2011
Mateus Augusto Moraes Ferreira   Matricula:435669
------------------------------------- 
Atividade: Correçao Prova de ARQ1 
------------------------------------------------
k.) montar a descrição por expressão no Verilog
do módulo capaz de calcular s1 pela expressão em (h)
------------------------------------------------
*/

module LetraK (output s1, input a, input b,
               input c, input d);


wire w1,w2;

xnor xnor1 (w1,a,c);
xnor xnor2 (w2,b,d);
and  and1  (s1,w1,w2);


endmodule//LetraJ

module LetraK_Test;

reg a,b,c,d;
wire s1;

LetraK teste1 (s1,a,b,c,d);

initial begin
$display("Correcao Prova ARQ1 - Letra k.)");
$display("Mateus Augusto Moraes Ferreira Matricula:435669");
$display("ab/cd  s1");
a=0; b=0; c=0; d=0;//--0
$monitor("%b%b %b%b  %b",a,b,c,d,s1);
#1 a=0; b=0; c=0; d=1;//--1
#1 a=0; b=0; c=1; d=0;//--2
#1 a=0; b=0; c=1; d=1;//--3
#1 a=0; b=1; c=0; d=0;//--4
#1 a=0; b=1; c=0; d=1;//--5
#1 a=0; b=1; c=1; d=0;//--6
#1 a=0; b=1; c=1; d=1;//--7
#1 a=1; b=0; c=0; d=0;//--8
#1 a=1; b=0; c=0; d=1;//--9
#1 a=1; b=0; c=1; d=0;//--10
#1 a=1; b=0; c=1; d=1;//--11
#1 a=1; b=1; c=0; d=0;//--12
#1 a=1; b=1; c=0; d=1;//--13
#1 a=1; b=1; c=1; d=0;//--14
#1 a=1; b=1; c=1; d=1;//--15

end
endmodule//LetraK_Test
				