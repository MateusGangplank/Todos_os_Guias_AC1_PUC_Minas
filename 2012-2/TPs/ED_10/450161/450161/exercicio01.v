`include "jk.v"
`include "clock.v"


module ram4x1(output[3:0] s,input [3:0] i,input addr,input wr,input clk);

wire [3:0]snot;
wire [3:0]ino;
wire a;

and and1(a,wr,clk,addr);
not no1(ino[0],i[0]);
not no1(ino[1],i[1]);
not no1(ino[2],i[2]);
not no1(ino[3],i[3]);

jkff jk1(s[0],snot[0],i[0],ino[0],a);
jkff jk2(s[1],snot[1],i[1],ino[1],a);
jkff jk3(s[2],snot[2],i[2],ino[2],a);
jkff jk4(s[3],snot[3],i[3],ino[3],a);

endmodule//endd

module principal;
wire [3:0] s;
reg[3:0] i;
reg wr;
reg addr;
wire clk;

clock c(clk);
ram4x1 mem(s,i,addr,wr,clk);

initial begin
i = 4'b0101;

wr = 0;
addr = 0;

$display("Exercicio0100 - RAM 1x4 memory - Mateus Guilherme do Carmo Cruz - 427446");
$display("clk \tRW \tAdr \tIN   - OUT");


$monitor("%b %b %b %4b %4b",clk,wr,addr,i,s);
#1 wr = 1; addr = 1;

#5 $finish;
end
endmodule
