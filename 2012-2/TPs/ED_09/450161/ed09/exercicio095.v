//------------------------------------------------
//Exercicio0091 - Contador assíncrono decrescente
//Nome: Guilherme Alves de OLivieira
//Matrícula: 450161
//------------------------------------------------
//observaçao esse nao deu tempo de terminar
`include "t.v"

module contador(output[3:0]s,input x,input y, input clear,input clk);

wire [3:0]qnot;
wire [3:0]snot;
wire snand;
wire sor;
tff t0(s[0],qnot[0],clk,c,clk,snand);
tff t1(s[1],qnot[1],qnot[0],y,qnot[0],snand);
tff t2(s[2],qnot[2],qnot[1],y,qnot[1],snand);
tff t3(s[3],qnot[3],qnot[2],y,qnot[2],snand);


not(snot[1],qnot[1]);
not(snot[3],qnot[3]);


and(sor,snot[1],s[0],s[2],snot[3]);

or(snand,sor,clear);

endmodule

module test;

reg j, k, clear;
reg clk;
wire [3:0] s;

contador ct1 (s,j,k,clear,clk);
/*
initial begin
  clear = 0;
  j = 1;
  k = 0;
  clk = 0;
end
*/
initial begin:main
               // execucao unitaria
      $display("Exercicio91 - xxx yyy zzz - 999999");
      $display("Teste 1:");
      $monitor ( "%d %b %b %b %b %b %b %b  %d", $time, j, k, clear, clk,  s[3], s[2], s[1], s[0],s ); 

#1 clk = 1; j=0; k=0; clear=0;
#1 clk = 0; k=1;
#1 clk = 1;
#1 clk = 0;
#1 clk = 1;
#1 clk = 0;
#1 clk = 1;
#1 clk = 0;
#1 clk = 1;
#1 clk = 0;
#1 clk = 1;
#1 clk = 0;
#1 clk = 1;
#1 clk = 1;
#1 clk = 0;
#1 clk = 1;
#1 clk = 0;
#1 clk = 1;
#1 clk = 0;
#1 clk = 1;
#1 clk = 0;
#1 clk = 1;
#1 clk = 0;
#1 clk = 1;
#1 clk = 0;
#1 clk = 1;
#1 clk = 0;
#1 clk = 1;
#1 clk = 0;
#1 clk = 0;
#1 clk = 1;
#1 clk = 0;
#1 clk = 1;
#1 clk = 0;
#1 clk = 1;
#1 clk = 0;
#1 clk = 1;
#1 clk = 0;
#1 clk = 1;
#1 clk = 0;
#1 clk = 1;
#1 clk = 0;
#1 clk = 0;
#1 clk = 1;
#1 clk = 0;
#1 clk = 1;
#1 clk = 0;
#1 clk = 1;
#1 clk = 0;
#1 clk = 1;
#1 clk = 0;
#1 clk = 1;
#1 clk = 0;
#1 clk = 1;
#1 clk = 0;
#1 clk = 0;
#1 clk = 1;
#1 clk = 0;
#1 clk = 1;
#1 clk = 0;
#1 clk = 1;


end
endmodule // testbuffer