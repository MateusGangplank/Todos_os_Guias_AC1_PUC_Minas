//------------------------------------------------
//Exercicio0091 - Contador assíncrono decrescente
//Nome: Guilherme Alves de OLivieira
//Matrícula: 450161
//------------------------------------------------

`include "jk.v"

module contador(output[5:0]s,input x, input y, input clear,input clk);

wire [5:0]qnot;
wire [5:0]snot;
wire snand;
wire sor;
jkff jk0(s[0],qnot[0],x,y,clk,snand);
jkff jk1(s[1],qnot[1],x,y,qnot[0],snand);
jkff jk2(s[2],qnot[2],x,y,qnot[1],snand);
jkff jk3(s[3],qnot[3],x,y,qnot[2],snand);
jkff jk4(s[4],qnot[4],x,y,qnot[3],snand);
jkff jk5(s[5],qnot[5],x,y,qnot[4],snand);

not(snot[0],s[0]);
not(snot[2],s[2]);
not(snot[4],s[4]);
not(snot[5],s[5]);

nand(sor,snot[0],s[1],snot[2],s[3],snot[4],snot[5]);

nand(snand,sor,clear);

endmodule

module test;

reg j, k, clear;
reg clk;
wire [5:0] s;

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
      $monitor ( "%d %b %b %b %b %b %b %b %b %b %d", $time, j, k, clear, clk, s[5],s[4], s[3], s[2], s[1], s[0],s ); 

#1 clk = 1; j=1; k=0; clear=1;
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

end
endmodule // testbuffer