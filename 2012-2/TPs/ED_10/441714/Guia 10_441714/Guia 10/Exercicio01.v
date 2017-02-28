//------------------------
//Yousef Otacilio
//441714
//Guia 10
//------------------------


`include "JKFF.v"
`include "CLOCK.v"


//---------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------
module Exercicio01(output [3:0]s, input[3:0]ent, input clk,input readWrite, input address, input clear);

	wire not0,not1,no2,not3;
	wire w;
	wire [3:0]q,qnot;
	
	and and1(w,clk,readWrite,address);
	
	ffJK flip1(q[0],qnot[0],ent[3],~ent[3],w,0,clear);
	ffJK flip2(q[1],qnot[1],ent[2],~ent[2],w,0,clear);
	ffJK flip3(q[2],qnot[2],ent[1],~ent[1],w,0,clear);
	ffJK flip4(q[3],qnot[3],ent[0],~ent[0],w,0,clear);
	
		
	and and1(s[0],q[3],address);
	and and2(s[1],q[2],address);
	and and3(s[2],q[1],address);
	and and4(s[3],q[0],address);

endmodule

//--------------------------------------------------------------
//--------------------------------------------------------------

module teste;

reg [3:0] entrada; 
wire [3:0] saida;

wire clk;
clock clk1(clk);
reg ad, rw, clear;	


Exercicio01 ram(saida, entrada, clk, rw, ad, clear);

initial begin
rw = 1;
ad =1;
		
entrada = 4'b1111;
		
$display ( "Memória 1x4 - Exercicio01 - Guia10" );
$display ( "Yousef Otacilio" );
$display ( "441714" );


$display ( "tclock\tADDR\tRW\tentrada\t saída" );
$monitor("%b \t%b \t%b \t%4b  -  %4b",clk,rw,ad,entrada,saida);

	
#1rw   = 1;
#2entrada = 4'b1111;
#3entrada = 4'b1001;

#25 $finish;
		
end
	
endmodule//

