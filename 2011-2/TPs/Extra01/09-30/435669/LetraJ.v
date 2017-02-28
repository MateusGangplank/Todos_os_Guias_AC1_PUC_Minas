/*
-------------------------------------
PUC-Minas - Ciência da Computação 
ARQ1 – Extra01
Entrega: 30/09/2011
Mateus Augusto Moraes Ferreira   Matricula:435669
------------------------------------- 
Atividade: Correçao Prova de ARQ1 
------------------------------------------------
j.) montar a descrição por portas do Verilog do 
módulo capaz de calcular s2 pela expressão em (d)
------------------------------------------------
*/

module LetraJ (output s2, input a, input b,
               input c, input d);


wire cnot,dnot;
wire w1,w2,w3,w4,w5;
wire s1;


not not1 (cnot,c);
not not2 (dnot,d);

and and1 (w1,b,cnot);
and and2 (w2,w1,dnot);
and and3 (w3,a,b);
and and4 (w4,w3,dnot);
and and5 (w5,a,cnot);

or or1 (s1,w2,w4);
or	or2 (s2,s1,w5);

endmodule//LetraJ

module LetraJ_Test;

reg a,b,c,d;
wire s2;

LetraJ teste1 (s2,a,b,c,d);

initial begin
$display("Correcao Prova ARQ1 - Letra j.)");
$display("Mateus Augusto Moraes Ferreira Matricula:435669");
$display("ab/cd  s2");
a=0; b=0; c=0; d=0;//--0
$monitor("%b%b %b%b  %b",a,b,c,d,s2);
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
endmodule//LetraJ_Test
				