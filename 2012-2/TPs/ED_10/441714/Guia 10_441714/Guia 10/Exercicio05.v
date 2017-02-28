//------------------------
//Yousef Otacilio
//441714
//Guia 10
//------------------------


`include "Exercicio04.v"


//---------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------
module Exercicio05(output [7:0]s, input[7:0]ent, input clk,input readWrite, input [2:0]address, input clear);

reg inDemux;

wire [0:3] wm;
wire [0:1] key;

wire [0:7] w1;
wire [0:7] w2;
wire [0:7] w3;
wire [0:7] w4;


assign key[0] = address[0];
assign key[1] = address[1];

dmx2bits dmx2(wm,inDemux,key);

and ade1 (d1, wm[0], address[2]);
and ade2 (d2, wm[1], address[2]);
and ade3 (d3, wm[2], address[2]);
and ade4 (d4, wm[3], address[2]);

Exercicio04 AD00(w1,ent,clk,readWrite,ad1,clear);
Exercicio04 AD01(w2,ent,clk,readWrite,ad2,clear);
Exercicio04 AD10(w3,ent,clk,readWrite,ad3,clear);
Exercicio04 AD11(w4,ent,clk,readWrite,ad4,clear);

mux2bits resposta (s,w1,w2,w3,w4,key);



//--Exercicio01 part1(s[3:0],ent[3:0],clk,readWrite,add,clear);
//--Exercicio01 part2(s[7:4],ent[7:4],clk,readWrite,add,clear);

endmodule

//--------------------------------------------------------------
//--------------------------------------------------------------

module teste5;

reg [7:0] entrada; 
wire [7:0] saida;

wire clk;
clock clk1(clk);
reg rw, clear;
reg [2:0] ad;	


Exercicio05 ram(saida, entrada, clk, rw, ad, clear);

initial begin
rw = 0;
ad =3'b000;
		
entrada = 8'b11111111;
		
$display ( "Memória - Exercicio05 - Guia10" );
$display ( "Yousef Otacilio" );
$display ( "441714" );


$display ( "tclock\tADDR\tRW\tentrada\t saída" );
$monitor("%b \t%b \t%b \t%8b  -  %8b",clk,ad,rw,entrada,saida);

	
#1rw   = 1;
#2entrada = 8'b11111111;
#3ad = 3'b100;
#4entrada = 8'b11001001;
#6rw   = 0;
#8ad =3'b000;
#12ad =1;



#540 $finish;
		
end
	
endmodule//

