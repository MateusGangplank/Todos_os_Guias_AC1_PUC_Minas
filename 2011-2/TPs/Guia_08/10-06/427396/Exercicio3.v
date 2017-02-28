// ------------------------- 
// Exercicio3
// Nome: Eduardo Manoel de Paula Junior
// Matricula: 427396
// ------------------------- 

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
module dff ( output q, output qnot, input d, input clk );
	reg q, qnot;
	always @( posedge clk )
	begin
		q = d;
		qnot = ~q;
	end
endmodule // dff 

// --------------------------------------------------------------------------------------------------
// --  Registrador de deslocamento circular para a direita, com 5 bits (estágios), 
// --------------------------------------------------------------------------------------------------
module rightRegister (output [4:0]s, input d, input clk);
wire nots;	
	
	dff FF0 (s[4], nots, d, clk);
	dff FF1 (s[3], nots, s[4], clk);
	dff FF2 (s[2], nots, s[3], clk);
	dff FF3 (s[1], nots, s[2], clk);
	dff FF4 (s[0], nots, s[1], clk);
	
endmodule//rightRegister

// -------------------------
// -- Teste
// -------------------------

module teste;
wire [4:0] saida;
reg d;
wire clock; 
clock clk ( clock ); 
rightRegister RF1 (saida, d, clock);
	
	initial begin
		$display("D CLOCK SAIDA");
		d = 1;
		$monitor("%1b    %1b    %5b", d, clock, saida);
		#23 d = 0;
		#120 $finish;
	end

endmodule //teste
