// ---------------------------------------
// Exercicio 02 - Guia 08
// Nome: Felipe Tôrres
// Matricula: 412738
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
endmodule //-- clock

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

// --------------------------------
// --  Registrador de deslocamento 
// ---------------------------------
module leftRegister (output [3:0]s, input d, input clk);

wire nots;
wire d1, d2, d3;
	
	FlipFlopD FF0 (s[0], nots, d, clk);

	or OR1 (d1, d, s[0]);
	FlipFlopD FF1 (s[1], nots, d1, clk);

	or OR2 (d2, d, s[1]);
	FlipFlopD FF2 (s[2], nots, d2, clk);

	or OR3 (d3, d, s[2]);
	FlipFlopD FF3 (s[3], nots, d3, clk);

	
endmodule//-- leftRegister

// -------------------------
// -- Teste
// -------------------------

module teste;

wire [3:0] saida;
reg d;
wire clock; 
clock clk ( clock ); 

leftRegister LF1 (saida, d, clock);
	
	initial begin
		
		$display("Exercicio 02 - Felipe Tôrres - 412738");
		$display("D CLOCK SAIDA");
		d = 1;
		$monitor("%1b    %1b    %4b", d, clock, saida);
		#23 d = 0;
		#120 $finish;
	end

endmodule //--Fim teste