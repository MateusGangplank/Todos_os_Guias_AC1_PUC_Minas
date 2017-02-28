//------------------------
//Yousef Otacilio
//441714
//Guia 10
//------------------------


`include "Exercicio01.v"
`include "plexers.v"


//---------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------
module Exercicio03(output [7:0]s, input[7:0]ent, input clk,input readWrite, input add, input clear);

Exercicio01 part1(s[3:0],ent[3:0],clk,readWrite,add,clear);
Exercicio01 part2(s[7:4],ent[7:4],clk,readWrite,add,clear);

endmodule

//--------------------------------------------------------------
//--------------------------------------------------------------

module teste2;

reg [7:0] entrada; 
wire [7:0] saida;

wire clk;
clock clk1(clk);
reg ad, rw, clear;	


Exercicio03 ram(saida, entrada, clk, rw, ad, clear);

initial begin
rw = 0;
ad =0;
		
entrada = 8'b11111111;
		
$display ( "Memória 2x4 - Exercicio03 - Guia10" );
$display ( "Yousef Otacilio" );
$display ( "441714" );


$display ( "tclock\tADDR\tRW\tentrada\t saída" );
$monitor("%b \t%b \t%b \t%8b  -  %8b",clk,ad,rw,entrada,saida);

	
#1rw   = 1;
#1ad   = 1;
#2entrada = 8'b11111111;

#50 $finish;
		
end
	
endmodule//

