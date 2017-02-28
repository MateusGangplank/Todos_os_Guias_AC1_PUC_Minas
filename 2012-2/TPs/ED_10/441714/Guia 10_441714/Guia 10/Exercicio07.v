//------------------------
//Yousef Otacilio
//441714
//Guia 10
//------------------------


`include "Exercicio03.v"


//---------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------
module Exercicio07(output [7:0]s, input[7:0]ent, input clk,input readWrite, input [1:0]address, input clear);

reg inDemux;

wire [0:3] wm;
wire [0:7] w1;
wire [0:7] w2;
wire [0:7] w3;
wire [0:7] w4;

dmx2bits dmx2(wm,inDemux,address);

Exercicio03 AD00(w1,ent,clk,readWrite,wm[0],clear);
Exercicio03 AD01(w2,ent,clk,readWrite,wm[1],clear);
Exercicio03 AD10(w3,ent,clk,readWrite,wm[2],clear);
Exercicio03 AD11(w4,ent,clk,readWrite,wm[3],clear);

mux2bits resposta (s,w1,w2,w3,w4,address);



//--Exercicio01 part1(s[3:0],ent[3:0],clk,readWrite,add,clear);
//--Exercicio01 part2(s[7:4],ent[7:4],clk,readWrite,add,clear);

endmodule

//--------------------------------------------------------------
//--------------------------------------------------------------

module teste7;

reg [7:0] entrada; 
wire [7:0] saida;

wire clk;
clock clk1(clk);
reg rw, clear;
reg [1:0] ad;	


Exercicio07 ram(saida, entrada, clk, rw, ad, clear);

initial begin
rw = 0;
ad =2'b00;
		
entrada = 8'b11111111;
		
$display ( "Memória - Exercicio07 - Guia10" );
$display ( "Yousef Otacilio" );
$display ( "441714" );


$display ( "tclock\tADDR\tRW\tentrada\t saída" );
$monitor("%b \t%b \t%b \t%8b  -  %8b",clk,ad,rw,entrada,saida);

	
#1rw   = 1;
#2entrada = 8'b11111111;
//--#3ad = 2'b10;
#4entrada = 8'b11001001;
#6rw   = 0;
//--#8ad =2'b01;
//--#12ad =2'b11;



#540 $finish;
		
end
	
endmodule//

