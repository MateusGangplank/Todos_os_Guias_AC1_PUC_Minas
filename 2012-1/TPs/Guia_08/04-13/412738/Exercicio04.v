//-----------------------------------------
// Exercicio 04 - Guia 08
// Nome: Felipe Tôrres
// Matricula: 412738
//-----------------------------------------

//-------------------------------
//-- CLOCK
//-------------------------------

module clock ( clk );
	output clk;
	reg clk;
	initial begin
	   clk = 1'b0;
	end
	
	always begin
	   #12 clk = ~clk;
	end
endmodule //-- clock ( )

//---------------------------
//-- FLIP FLOP D
//---------------------------
module FlipFlopD(q,qnot,data,clk);
	output q;
	output qnot;
	input data;
	input clk;
	
	reg q,qnot;
	
	initial begin
		q = 1'b0;
		qnot = 1'b1;
	end
	always @ (posedge clk)
		begin
		q <= data;	qnot <= ~q;
		end
			
endmodule //--FlipFlopD

//-------------------------------------------------------------
//--  Registrador de deslocamento circular em anel torcido
//-------------------------------------------------------------
module rotateLeftRegister (output [3:0]s, input d, input clk);

wire nots;	
	
	or OR1 (d0, d, s[3]);
	
	FlipFlopD FF0 (s[0], nots, d0, clk);
	FlipFlopD FF1 (s[1], nots, s[0], clk);
	FlipFlopD FF2 (s[2], nots, s[1], clk);
	FlipFlopD FF3 (s[3], nots, s[2], clk);
	
	
endmodule//---- rotateLeftRegister

//-- -------------------------
//-- -- Teste
//-- -------------------------

module teste;

wire [3:0] saida;
reg d;
wire clock; 
clock clk ( clock ); 

rotateLeftRegister RLF1 (saida, d, clock);
	
	initial begin
		$display("Exercicio 04 - Felipe Tôrres - 412738");
		$display("D CLOCK SAIDA");
		d = 1;
		$monitor("%1b    %1b    %4b", d, clock, saida);
		#23 d = 0;
		#240 $finish;
	end

endmodule //--teste