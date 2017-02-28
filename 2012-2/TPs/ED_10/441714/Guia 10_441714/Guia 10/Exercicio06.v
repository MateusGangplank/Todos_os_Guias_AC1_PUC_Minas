//------------------------
//Yousef Otacilio
//441714
//Guia 10
//------------------------


`include "Exercicio03.v"


//---------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------
module Exercicio06(output [15:0]s, input[15:0]ent, input clk,input readWrite, input add, input clear);

Exercicio03 part1(s[7:0],ent[7:0],clk,readWrite,add,clear);
Exercicio03 part2(s[15:8],ent[15:8],clk,readWrite,add,clear);

endmodule

//--------------------------------------------------------------
//--------------------------------------------------------------

module teste6;

reg [15:0] entrada; 
wire [15:0] saida;

wire clk;
clock clk1(clk);
reg ad, rw, clear;	


Exercicio06 ram(saida, entrada, clk, rw, ad, clear);

initial begin
rw = 0;
ad =0;
		
entrada = 16'b1111111111111111;
		
$display ( "Memória 2x4 - Exercicio03 - Guia10" );
$display ( "Yousef Otacilio" );
$display ( "441714" );


$display ( "tclock\tADDR\tRW\tentrada\t saída" );
$monitor("%b \t%b \t%b \t%8b  -  %8b",clk,ad,rw,entrada,saida);

	
#1rw   = 1;
#1ad   = 1;
#16entrada = 16'b1100000000111111;

#50 $finish;
		
end
	
endmodule//

