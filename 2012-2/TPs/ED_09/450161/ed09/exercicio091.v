//------------------------------------------------
//Exercicio0091 - Contador assíncrono decrescente
//Nome: Guilherme Alves de OLivieira
//Matrícula: 450161
//------------------------------------------------

`include "jk.v"

module contador(output[4:0]s,input x, input y, input clear,input clk);

wire [4:0]qnot;


jkff jk0(s[0],qnot[0],x,y,clk,clear);
jkff jk1(s[1],qnot[1],x,y,s[0],clear);
jkff jk2(s[2],qnot[2],x,y,s[1],clear);
jkff jk3(s[3],qnot[3],x,y,s[2],clear);
jkff jk4(s[4],qnot[4],x,y,s[3],clear);

endmodule

module test;

reg j, k, clear;
reg clk;
wire [4:0] s;

contador ct1 (s,j,k,clear,clk);
/*
initial begin
  clear = 1;
  j = 1;
  k = 0;
  clk = 0;
end
*/
initial begin:main
               // execucao unitaria
      $display("Exercicio91 - xxx yyy zzz - 999999");
      $display("Teste 1:");
      $monitor ( "%d %b %b %b %b %b %b %b %b %b %d", $time, j, k, clear, clk, s[4], s[3], s[2], s[1], s[0],s ); 

#1 clk = 1; j=1; k=0; clear=0;
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
#1 clk = 0;

end
endmodule // testbuffer