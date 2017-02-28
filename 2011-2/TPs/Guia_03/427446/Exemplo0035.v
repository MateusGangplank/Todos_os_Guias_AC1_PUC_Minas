//---------------------------------------------------
//Exemplo0035 - Operações not,or,nor,and,nand,xor e xnor simultaneas
//Nome: Mateus Guilherme do Carmo Cruz
//Matrícula: 427446
//--------------------------------------------------------

//operações

module operation(s,a,b);
input [3:0]a;
input [3:0]b;
output [31:0]s;
wire[31:0]s;

// op not (31 a 24);----------
not not1(s[31],a[3]);
not not2(s[30],a[2]);
not not3(s[29],a[1]);
not not4(s[28],a[0]);

not not5(s[27],b[3]);
not not6(s[26],b[2]);
not not7(s[25],b[1]);
not not8(s[24],b[0]);
//Fim op not------------------

//op or(23 a 20);-------------
or or1(s[23],a[3],b[3]);
or or2(s[22],a[2],b[2]);
or or3(s[21],a[1],b[1]);
or or4(s[20],a[0],b[0]);
//Fim op or-------------------

//op nor(19 a 16);-----------
nor nor1(s[19],a[3],b[3]);
nor nor2(s[18],a[2],b[2]);
nor nor3(s[17],a[1],b[1]);
nor nor4(s[16],a[0],b[0]);
//Fim op nor-----------------

//op and(15 a 12);-----------
and and1(s[15],a[3],b[3]);
and and2(s[14],a[2],b[2]);
and and3(s[13],a[1],b[1]);
and and4(s[12],a[0],b[0]);
//Fim op and-----------------
	
//op nand(11 a 8);------------
nand nand1(s[11],a[3],b[3]);
nand nand2(s[10],a[2],b[2]);
nand nand3(s[9],a[1],b[1]);
nand nand4(s[8],a[0],b[0]);
//Fim op nand-----------------

//op xor(7 a 4);--------------
xor xor1(s[7],a[3],b[3]);
xor xor2(s[6],a[2],b[2]);
xor xor3(s[5],a[1],b[1]);
xor xor4(s[4],a[0],b[0]);
//Fim op xor------------------

//op xnor(3 a 0);-------------
xnor xnor1(s[3],a[3],b[3]);
xnor xnor2(s[2],a[2],b[2]);
xnor xnor3(s[1],a[1],b[1]);
xnor xnor4(s[0],a[0],b[0]);
//Fim op xnor

endmodule //operation

module principal;
//definir dados
reg[3:0]a;
reg[3:0]b;
wire[31:0]s;

initial begin:start
	a = 4'b0000;
	b = 4'b0000;
end

operation op1(s,a,b);//instanciar

//parte principal
initial begin:main
		$display("Exemplo0035 - Mateus Guilherme do Carmo Cruz - 427446");
		$display("LU's test - operações not, or, nor, and, nand, xor, xnor simultâneas");
		$display("a: %4b \t b: %4b", a,b);
		$display("                  (~a) (~b) (a | b) (a ~| b) (a & b) (a ~& b) (a ^ b) (a ~^ b)");
		$monitor("%d %4b %4b  %4b %4b %4b %4b %4b %4b", $time,
					s[31:28],s[27:24],s[23:20],s[19:16],s[15:12],s[11:8],s[7:4],s[3:0]);
					#1 a = 4'b0101; b = 4'b1110;

end
endmodule//principal