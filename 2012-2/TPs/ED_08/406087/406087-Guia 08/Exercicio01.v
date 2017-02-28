// ---------------------------------------
// Exercicio 01 - Guia 08
// Nome: Fabio Fiuza Pereira
// Matricula: 406087
// ---------------------------------------

//-----------------------------
// -- CLOCK
//-----------------------------
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

// -------------------------
// -- FLIP FLOP D
// -------------------------
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

// ---------------------------------------------------
// --  Registrador de deslocamento para a esquerda 5
// ---------------------------------------------------

module leftRegister (output [4:0]s, input d, input clk);

wire nots;

	FlipFlopD FF0 (s[0], nots, d, clk);
	FlipFlopD FF1 (s[1], nots, s[0], clk);
	FlipFlopD FF2 (s[2], nots, s[1], clk);
	FlipFlopD FF3 (s[3], nots, s[2], clk);
	FlipFlopD FF3 (s[3], nots, s[3], clk);
	FlipFlopD FF3 (s[3], nots, s[4], clk);
	

endmodule//-- leftRegister

// -------------------------
// -- Teste do Modulo
// -------------------------

module teste;

wire [4:0] saida;
reg d;
wire clock; 
clock clk ( clock ); 

leftRegister LF1 (saida, d, clock);
	
	initial begin
		$display("Fabio Fiuza Pereira -406087");
		$display("D  - Clock - 	Saida");
		d = 1;
		$monitor("%1b    %1b		%5", d, clock, saida);
		#25 d = 0;
		#120 $finish;
	end

endmodule //-- Final teste