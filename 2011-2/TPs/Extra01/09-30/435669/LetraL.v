/*
-------------------------------------
PUC-Minas - Ciência da Computação 
ARQ1 – Extra01
Entrega: 30/09/2011
Mateus Augusto Moraes Ferreira   Matricula:435669
------------------------------------- 
Atividade: Correçao Prova de ARQ1 
------------------------------------------------
l. ) montar a descrição por portas do Verilog do 
módulo capaz de calcular s0, usando entradas e 
saídas múltiplas (em Little Endian)
------------------------------------------------
*/

module LetraL (output s0, input a, input b,
               input c, input d);



wire anot,bnot;
wire w1,w2;

not not1 (anot,a);
not not2 (bnot,b);

and and1 (w1,bnot,d);
or  or1  (w2,w1,c);
and and2 (s0,w1,w2);


endmodule//LetraL

module LetraL_4B (output [3:0] s0, input [3:0] a, input [3:0] b,
                  input [3:0] c, input [3:0] d);

LetraL teste0 (s0[0],a[0],b[0],c[0],d[0]);
LetraL teste1 (s0[1],a[1],b[1],c[1],d[1]);
LetraL teste2 (s0[2],a[2],b[2],c[2],d[2]);
LetraL teste3 (s0[3],a[3],b[3],c[3],d[3]);

endmodule//LetraL_4B

module LetraL_Test;

reg [3:0] a,b,c,d;
wire [3:0] s0;

LetraL_4B teste0 (s0,a,b,c,d);

initial begin
$display("Correcao Prova ARQ1 - Letra l.)");
$display("Mateus Augusto Moraes Ferreira Matricula:435669");
$display("  a    b    c    d    s0");

a=4'b0000; b=4'b0000; c=4'b0000; d=4'b0000;

$monitor("%b %b %b %b  %b",a,b,c,d,s0);
#1 a=4'b0001; b=4'b0000; c=4'b0000; d=4'b0001;
#1 a=4'b0101; b=4'b0110; c=4'b0111; d=4'b1000;
#1 a=4'b1001; b=4'b1010; c=4'b1011; d=4'b1100;
#1 a=4'b1101; b=4'b1110; c=4'b1111; d=4'b0111;

end
endmodule//LetraL_Test
				