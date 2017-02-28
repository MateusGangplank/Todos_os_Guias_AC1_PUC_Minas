//------------------------
//Yousef Otacilio
//441714
//Guia 10
//------------------------


`include "Exercicio01.v"
`include "plexers.v"


//---------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------
module Exercicio02(output [3:0]s, input[3:0]ent, input clk,input readWrite, input address, input clear);

reg inDemux;
wire [0:3] w1;
wire [0:3] w2; 

dmx1bit dmx1(wm0,wm1,inDemux,address);

Exercicio01 AD0(w1,ent,clk,readWrite,wm0,clear);
Exercicio01 AD1(w2,ent,clk,readWrite,wm1,clear);

mux1bit mux1(s,w1,w2,address);

initial begin
		  inDemux = 1'b1;
	     end

endmodule

//--------------------------------------------------------------
//--------------------------------------------------------------

module teste2;

reg [3:0] entrada; 
wire [3:0] saida;

wire clk;
clock clk1(clk);
reg ad, rw, clear;	


Exercicio02 ram(saida, entrada, clk, rw, ad, clear);

initial begin
rw = 1;
ad =1;
		
entrada = 4'b1111;
		
$display ( "Memória 2x4 - Exercicio02 - Guia10" );
$display ( "Yousef Otacilio" );
$display ( "441714" );


$display ( "tclock\tADDR\tRW\tentrada\t saída" );
$monitor("%b \t%b \t%b \t%4b  -  %4b",clk,ad,rw,entrada,saida);

	
#1rw   = 1;
#2entrada = 4'b1111;
#3ad =0;
#4entrada = 4'b1100;
#6rw   = 0;
#8ad =0;
#12ad =1;



#50 $finish;
		
end
	
endmodule//

