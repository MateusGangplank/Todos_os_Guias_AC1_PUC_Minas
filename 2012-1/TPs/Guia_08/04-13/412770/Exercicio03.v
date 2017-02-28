// ---------------------------------------
// Exercicio 03 - Guia 08
// Nome: Rayan Darwin
// Matricula: 412770
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
endmodule // clock ( )

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

// ----------------------------------------------------------
// --  Registrador de deslocamento circular para a direita
// ----------------------------------------------------------
module rightRegister (output [3:0]s, input d, input clk);
wire nots;	
	
	FlipFlopD FF0 (s[3], nots, d, clk);
	FlipFlopD FF1 (s[2], nots, s[3], clk);
	FlipFlopD FF2 (s[1], nots, s[2], clk);
	FlipFlopD FF3 (s[0], nots, s[1], clk);
	
	
endmodule//--rightRegister

// -------------------------
// -- Teste
// -------------------------

module teste;

wire [3:0] saida;
reg d;
wire clock; 
clock clk ( clock ); 

rightRegister RF1 (saida, d, clock);
	
	initial begin
		$display("Exercicio 03 - Rayan Darwin - 412770");
		$display("D CLOCK SAIDA");
		d = 1;
		$monitor("%1b    %1b    %5b", d, clock, saida);
		#23 d = 0;
		#120 $finish;
	end

endmodule //--teste
